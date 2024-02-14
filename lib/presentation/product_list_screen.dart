import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/bloc/products_bloc.dart';
import 'package:products_app/presentation/components/product_list_item.dart';
import 'package:products_app/presentation/product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(FetchProductsListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: const Text('Products List'),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is! ProductsSuccess) {
            return const Center(
              child: Text('Oops.. something went wrong'),
            );
          }
          final productsList = state.productList;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
                itemCount: productsList.length,
                itemBuilder: (context, index) {
                  return ProductListItem(
                    productsListModel: productsList[index],
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(product: productsList[index]),
                        ),
                      );
                    },
                  );
                }),
          );
        },
      ),
    );
  }
}
