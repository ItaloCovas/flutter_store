import 'package:flutter/foundation.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:meta/meta.dart';

class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;

  ProductsModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.image});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        category: json["category"],
        description: json["description"],
        image: json["image"]);
  }
}
