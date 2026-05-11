import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_store_demo/features/home/data/models/product_model.dart';
import 'package:flutter_store_demo/features/home/data/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

part 'product_event.dart';

part 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IHomeRepo _repo;

  ProductBloc(this._repo) : super(ProductInitial()) {
    on<GetAllProducts>(_onLoadData);
  }

  Future<void> _onLoadData(
      GetAllProducts event,
      Emitter<ProductState> emit,
      ) async {
    if (state is ProductSuccess &&
        (state as ProductSuccess).hasReachedMax &&
        event.offset != 0) {
      return;
    }

    final currentState = state;
    List<ProductModel> oldData = [];

    if (currentState is! ProductSuccess || event.offset == 0) {
      emit(ProductLoading());
    }

    if (currentState is ProductSuccess && event.offset != 0) {
      oldData = currentState.products;
      emit(currentState.copyWith(isLoadingMore: true));
    }

    final int currentOffset = event.offset ?? 0;

    final response = await _repo.products(
      offset: currentOffset,
      limit: event.limit ?? 20,
      search: event.search,
      categoryId: event.categoryId,
      branchId: event.branchId,
    );

    response.when(
      success: (data) {
        final List<ProductModel> newData = data?.results ?? [];

        emit(
          ProductSuccess(
            products: currentOffset == 0 ? newData : oldData + newData,
            totalCount: data?.count ?? 0,
            hasReachedMax: data?.next == null || newData.isEmpty,
            isLoadingMore: false,
          ),
        );
      },
      error: (msg, data) {
        String errorMessage = '';
        try {
          final decoded = jsonDecode(data);
          errorMessage = decoded['detail'] ?? '';
        } catch (_) {
          errorMessage = data.toString();
        }
        return emit(ProductError(message: errorMessage));
      },
    );
  }
}
