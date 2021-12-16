import 'package:flutter/foundation.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:meta/meta.dart';

class CartsModel {
  int id;
  int userId;
  String date;
  List<Products> products;
  int iV;

  CartsModel(
      {required this.id,
      required this.userId,
      required this.date,
      required this.products,
      required this.iV});
  factory CartsModel.fromJson(Map<String, dynamic> json) {
    return CartsModel(
      id: json['id'],
      userId: json['userId'],
      date: json['date'],
      products: (json['products'] != null
          ? Products.fromJson(json['products'])
          : null!),
      iV: json['v'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['userId'] = userId;
    data['date'] = date;
    if (products != null) {
      data['products'] = products.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

class Products {
  int productId;
  int quantity;

  Products({required this.productId, required this.quantity});
  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(productId: json['productId'], quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = productId;
    data['quantity'] = quantity;
    return data;
  }
}
