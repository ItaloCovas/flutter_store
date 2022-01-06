import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:meta/meta.dart';

class CartModel {
  int? id;
  int? userId;
  String? date;
  List<Products>? products;
  int? iV;

  CartModel({this.id, this.userId, this.date, this.products, this.iV});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['userId'] = userId;
    data['date'] = date;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
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
