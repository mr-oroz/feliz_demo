part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductSuccess extends ProductState {
  final List<ProductModel> products;
  final bool hasReachedMax;
  final bool isLoadingMore;
  final int totalCount;

  const ProductSuccess({
    required this.products,
    this.hasReachedMax = false,
    this.isLoadingMore = false,
    required this.totalCount,
  });

  @override
  List<Object> get props => [
    products,
    hasReachedMax,
    totalCount,
    isLoadingMore,
  ];

  ProductSuccess copyWith({
    List<ProductModel>? products,
    bool? hasReachedMax,
    bool? isLoadingMore,
    int? totalCount,
  }) {
    return ProductSuccess(
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      totalCount: totalCount ?? this.totalCount,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
