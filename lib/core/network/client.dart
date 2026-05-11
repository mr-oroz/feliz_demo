import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_store_demo/core/network/auth_inspector.dart';
import 'package:flutter_store_demo/core/network/local_storage/local_storage.dart';
import 'package:flutter_store_demo/core/network/models/api_response.dart';
import 'package:logging/logging.dart';
import 'package:tf_dio_cache/tf_dio_cache.dart';

class ApiClient {
  final Dio _dio;
  final Logger _logger;
  final Function()? onErrorRefreshToken;

  ApiClient._(this._dio, {this.onErrorRefreshToken})
    : _logger = Logger('ApiClient');

  factory ApiClient(
    String baseUrl, {
    required LocalStorage storage,
    final Function()? onErrorRefresh,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        responseType: ResponseType.plain,
      ),
    );
    dio.interceptors.add(AuthInterceptor(storage: storage));
    dio.interceptors.add(
      DioCacheManager(
        CacheConfig(defaultMaxAge: const Duration(days: 7), baseUrl: baseUrl),
      ).interceptor,
    );

    return ApiClient._(dio, onErrorRefreshToken: onErrorRefresh);
  }

  Future<ApiResponse<T>> get<T>(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    required T Function(dynamic data) decoder,
  }) {
    return request<T>(
      url,
      'get',
      decoder: decoder,
      params: params,
      options: options,
    );
  }

  Future<ApiResponse<T>> post<T>(
    String url, {
    required T Function(dynamic data)? decoder,
    dynamic data,
    bool asFormData = false,
    Map<String, dynamic>? params,
  }) async {
    dynamic requestData = data;

    if (asFormData && data is Map<String, dynamic>) {
      requestData = FormData.fromMap(data);
    }

    final options = asFormData
        ? Options(contentType: 'multipart/form-data')
        : Options();

    return request<T>(
      url,
      'POST',
      decoder: decoder,
      data: requestData,
      options: options,
      params: params,
    );
  }

  Future<ApiResponse<T>> put<T>(
    String url, {
    T Function(dynamic data)? decoder,
    dynamic data,
  }) {
    return request<T>(url, 'PUT', decoder: decoder, data: data);
  }

  Future<ApiResponse<T>> patch<T>(
    String url, {
    required T Function(dynamic data)? decoder,
    dynamic data,
    bool asFormData = false,
    Map<String, dynamic>? params,
  }) async {
    dynamic requestData = data;

    if (asFormData && data is Map<String, dynamic>) {
      requestData = FormData.fromMap(data);
    }

    final options = asFormData
        ? Options(contentType: 'multipart/form-data')
        : Options();

    return request<T>(
      url,
      'PATCH',
      decoder: decoder,
      data: requestData,
      options: options,
      params: params,
    );
  }

  Future<ApiResponse<T>> delete<T>(
    String url, {
    T Function(dynamic data)? decoder,
    dynamic params,
    dynamic data,
  }) {
    return request<T>(
      url,
      'DELETE',
      decoder: decoder,
      params: params,
      data: data,
    );
  }

  Future<ApiResponse<T>> request<T>(
    String url,
    String method, {
    required T Function(dynamic data)? decoder,
    Map<String, dynamic>? params,
    dynamic data,
    Options? options,
    bool useCacheOnError = true,
  }) async {
    final model = ApiResponse<T>();
    bool fromCache = false;
    try {
      final response = await _dio.request(
        url,
        queryParameters: params,
        data: data,
        options: (options ?? Options()).copyWith(method: method),
      );

      model.statusCode = response.statusCode;

      dynamic responseData = response.data;

      if (responseData is String) {
        final raw = responseData.trim();
        if (raw.startsWith('{') || raw.startsWith('[')) {
          try {
            responseData = jsonDecode(raw);
          } catch (e) {
            model.message = 'JSON decoding failed: $e. Raw: $raw';
            model.statusCode = response.statusCode;
            return model;
          }
        } else {
          responseData = raw;
        }
      }

      if (responseData is Map && responseData['message'] != null) {
        model.message = responseData['message'];
      }

      if (decoder != null && responseData != null) {
        try {
          model.result = decoder(responseData);
        } catch (e) {
          model.message = 'Decoder error: $e';
        }
      }
    } on DioException catch (e) {
      model.statusCode = e.response?.statusCode;
      model.errorData = e.response?.data;
      model.message = e.message;

      try {
        final cacheResponse = await _dio.request(
          url,
          queryParameters: params,
          data: data,
          options: (options ?? Options()).copyWith(
            method: method,
            extra: {
              ...?options?.extra,
              'refresh': false,
              'cachePolicy': 'forceCache',
            },
          ),
        );

        if (cacheResponse.statusCode == 200) {
          model.statusCode = cacheResponse.statusCode;
          fromCache = true;

          dynamic cacheData = _processResponseData(cacheResponse.data);

          if (decoder != null) {
            try {
              model.result = decoder(cacheData);
              model.message = 'Данные загружены из кеша (сеть недоступна)';
            } catch (e) {
              print('❌ Cache decoder error: $e');
            }
          }
        }
      } catch (cacheError) {
        model.statusCode = e.response?.statusCode;
        model.errorData = e.response?.data;
        model.message = e.message ?? 'Network error';
      }
    } catch (e) {
      model.message = 'Unexpected error: $e';
    }

    return model;
  }

  dynamic _processResponseData(dynamic data) {
    if (data is String) {
      final raw = data.trim();

      if (raw.startsWith('{') || raw.startsWith('[')) {
        try {
          final jsonData = jsonDecode(raw);
          return jsonData;
        } catch (e) {
          print('❌ JSON parsing failed: $e');
        }
      } else {
        return {'detail': 'Код отправлен'};
      }
    }
    return data;
  }
}
