// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';


class ProductsListModel {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  dynamic rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;
  ProductsListModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

 
  

  ProductsListModel copyWith({
    int? id,
    String? title,
    String? description,
    int? price,
    double? discountPercentage,
    dynamic rating,
    int? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) {
    return ProductsListModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory ProductsListModel.fromMap(Map<String, dynamic> map) {
     return ProductsListModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      discountPercentage: map['discountPercentage'] ,
      rating: map['rating'] ,
      stock: map['stock'],
      brand: map['brand'],
      category: map['category'] ,
      thumbnail: map['thumbnail'],
      images: map['images'] != null ? List<String>.from((map['images'] as List<dynamic>)) : null,
    );
    // return ProductsListModel(
    //   id: map['id'] != null ? map['id'] as int : null,
    //   title: map['title'] != null ? map['title'] as String : null,
    //   description: map['description'] != null ? map['description'] as String : null,
    //   price: map['price'] != null ? map['price'] as int : null,
    //   discountPercentage: map['discountPercentage'] != null ? map['discountPercentage'] as double : null,
    //   rating: map['rating'] != null ? map['rating'] as double : null,
    //   stock: map['stock'] != null ? map['stock'] as int : null,
    //   brand: map['brand'] != null ? map['brand'] as String : null,
    //   category: map['category'] != null ? map['category'] as String : null,
    //   thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
    //   images: map['images'] != null ? List<String>.from((map['images'] as List<dynamic>)) : null,
    // );
  }

  String toJson() => json.encode(toMap());

  factory ProductsListModel.fromJson(String source) => ProductsListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductsListModel(id: $id, title: $title, description: $description, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, brand: $brand, category: $category, thumbnail: $thumbnail, images: $images)';
  }

  @override
  bool operator ==(covariant ProductsListModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.price == price &&
      other.discountPercentage == discountPercentage &&
      other.rating == rating &&
      other.stock == stock &&
      other.brand == brand &&
      other.category == category &&
      other.thumbnail == thumbnail &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      price.hashCode ^
      discountPercentage.hashCode ^
      rating.hashCode ^
      stock.hashCode ^
      brand.hashCode ^
      category.hashCode ^
      thumbnail.hashCode ^
      images.hashCode;
  }
}
