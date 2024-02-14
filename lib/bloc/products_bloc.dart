// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:products_app/data/repository/products_repository.dart';
import 'package:products_app/model/products_list_model/product_list_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsRepository productsRepository;
  ProductsBloc(
    this.productsRepository,
  ) : super(ProductsInitial()) {
    on<FetchProductsListEvent>(_onProductsFetched);
  }

  void _onProductsFetched(
    FetchProductsListEvent event,
    Emitter<ProductsState> emit,
  ) async{
    emit(ProductsLoading());
    try {
      final productList = await productsRepository.getProducts();
      emit(ProductsSuccess(productList));
    } catch (e) {
      emit(ProductsFailure(e.toString()));
    }
  }
}
