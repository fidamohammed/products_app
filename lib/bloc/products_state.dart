part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductsListModel> productList;

  ProductsSuccess(this.productList);
}

final class ProductsFailure extends ProductsState {
  final String error;

  ProductsFailure(this.error);
}
