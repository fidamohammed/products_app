import 'package:flutter/material.dart';
import 'package:products_app/model/products_list_model/product_list_model.dart';

class ProductListItem extends StatelessWidget {
  final ProductsListModel productsListModel;
  final VoidCallback? onClick;
  const ProductListItem({super.key, required this.productsListModel, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(productsListModel.thumbnail ?? ""),
                      fit: BoxFit.cover
                    )),
                // child: Image.network(productsListModel.images?[0] ?? ""),
              ),
              // const Text('Image comes here'),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text(productsListModel.title ?? ""),
                      Text(productsListModel.brand ?? "", style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text("£ ${productsListModel.price?.toString() ?? ""}")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
