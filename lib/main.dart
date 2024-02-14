import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/bloc/products_bloc.dart';
import 'package:products_app/data/remote/products_data_provider.dart';
import 'package:products_app/data/repository/products_repository.dart';
import 'package:products_app/presentation/product_list_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) => ProductsRepository(
        ProductsDataProvider(),
      ),
      child: BlocProvider(
          create: (context) => ProductsBloc(
                context.read<ProductsRepository>(),
              ),
          child: const MaterialApp(
            home: ProductListScreen(),
          )),
    );
  }
}
