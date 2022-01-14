import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:meta/meta.dart';

class ProductsModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  ProductsModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        id: json['id'],
        title: json['title'],
        price: double.parse(json['price'].toString()),
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating:
            (json['rating'] != null ? Rating.fromJson(json['rating']) : null)!);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating.toJson();
    }
    return data;
  }
}

class Rating {
  double rate;
  int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
        rate: double.parse(json['rate'].toString()), count: json['count']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
