import 'package:flutter_store_demo/core/constants/api_contants.dart';
import 'package:flutter_store_demo/core/network/client.dart';
import 'package:flutter_store_demo/core/network/models/api_response.dart';
import 'package:flutter_store_demo/core/network/models/pagination_model.dart';
import 'package:flutter_store_demo/features/home/data/models/product_model.dart';

abstract class IHomeRepo {

  Future<ApiResponse> products({
    int? limit,
    int? offset,
    String? search,
    String? branchId,
    String? categoryId,
  });

  Future<ApiResponse> productId({required String id});
}

base class HomeRepo implements IHomeRepo {
  HomeRepo({required ApiClient client}) : _client = client;
  final ApiClient _client;


  @override
  Future<ApiResponse<PaginationModel<ProductModel>>> products({
    int? limit,
    int? offset,
    String? branchId,
    String? categoryId,
    String? search,
  }) async {
    final response = await _client.get(
      ApiConstants.products,
      params: {
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
        if (branchId != null) 'branch_id': branchId,
        if (categoryId != null) 'category_id': categoryId,
        if (search != null) 'search': search,
      },
      decoder: (data) {
        return PaginationModel<ProductModel>.fromJson(
          data as Map<String, dynamic>,
              (json) => ProductModel.fromJson(json as Map<String, dynamic>),
        );
      },
    );
    return response;
  }

  @override
  Future<ApiResponse<ProductModel>> productId({required String id}) async {
    final response = await _client.get(
      '${ApiConstants.products}/$id',
      decoder: (data) {
        return ProductModel.fromJson(data as Map<String, dynamic>);
      },
    );
    return response;
  }
}
