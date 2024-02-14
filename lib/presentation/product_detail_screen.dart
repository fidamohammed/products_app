import 'package:flutter/material.dart';
import 'package:products_app/model/products_list_model/product_list_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductsListModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? "Product Detail"),
      ),
      body: Center(
        child: Column(
          children: [
            _titleCard(context, product),
            _detailBody(product),
            _images(product),
          ],
        ),
      ),
    );
  }
}

Widget _titleCard(BuildContext context, ProductsListModel product) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                    product.thumbnail ?? "",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            product.title ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    ),
  );
}

Widget _detailBody(ProductsListModel product) {
  return Column(
    children: [
      Text(product.description ?? ""),
      Text(product.rating.toString()),
      Text(product.category ?? ""),
      Text(product.brand ?? "")
    ],
  );
}

Widget _images(ProductsListModel product) {
  return Container(
    height: 200,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: product.images?.map(
            (e) {
              return Container(
                padding: EdgeInsets.all(10),
                width: 150,
                child: Image.network(e, fit: BoxFit.fitWidth,),
              );
            },
          ).toList() ??
          [],
    ),
  );
}
