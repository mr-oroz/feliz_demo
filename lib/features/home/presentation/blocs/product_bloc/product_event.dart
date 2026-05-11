part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetAllProducts extends ProductEvent {
  final int? limit;
  final int? offset;
  final String? branchId;
  final String? categoryId;
  final String? search;

  const GetAllProducts({
    this.limit,
    this.offset,
    this.search,
    this.branchId,
    this.categoryId,
  });

  @override
  List<Object?> get props => [offset, limit, search, branchId, categoryId];
}
