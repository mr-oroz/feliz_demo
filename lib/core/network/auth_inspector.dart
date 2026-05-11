import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_store_demo/core/network/local_storage/local_storage.dart';

import '../routes/router.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required LocalStorage storage}) : _storage = storage;

  final LocalStorage _storage;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
    options.headers[HttpHeaders.acceptHeader] = 'application/json';

    final token = _storage.getString('token');
    if (token != null && token.isNotEmpty) {
      options.headers[HttpHeaders.authorizationHeader] = 'Token $token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final isGuest = _storage.getBool('isGuest') ?? false;

    if (err.response?.statusCode == 401) {
      if (isGuest) {
        return handler.next(err);
      }

      _logoutUser();
      router.go('/auth');
    }

    handler.next(err);
  }

  void _logoutUser() {
    _storage.remove('token');
    _storage.remove('isRegistered');
    _storage.remove('isGuest');
  }
}
