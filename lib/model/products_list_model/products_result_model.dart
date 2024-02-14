import 'dart:convert';

import 'package:products_app/model/products_list_model/product_list_model.dart';


class ProductsResultModel {
  List<ProductsListModel>? products;
  int? total;
  int? skip;
  int? limit;

  ProductsResultModel({this.products, this.total, this.skip, this.limit});

  factory ProductsResultModel.fromMap(Map<String, dynamic> data) {
    return ProductsResultModel(
      // products: (data['products'] as List<dynamic>?)
      //     ?.map((e) => ProductsListModel.fromMap(e as Map<String, dynamic>))
      //     .toList(),
      products: (data['products'] as List<dynamic>?)
          ?.map((e) => ProductsListModel.fromMap(e as Map<String, dynamic>))
          .toList(),
      total: data['total'] as int?,
      skip: data['skip'] as int?,
      limit: data['limit'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'products': products?.map((e) => e.toMap()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductsResultModel].
  factory ProductsResultModel.fromJson(String data) {
    return ProductsResultModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductsResultModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
