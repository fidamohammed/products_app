part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class FetchProductsListEvent extends ProductsEvent{}
