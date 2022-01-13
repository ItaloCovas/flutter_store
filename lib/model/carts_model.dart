import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:flutter_store/model/products_model.dart';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:meta/meta.dart';

class CartProducts {
  ProductsModel products;
  int quantity;

  CartProducts({required this.products, required this.quantity});

  factory CartProducts.fromJson(Map<String, dynamic> json) {
    return CartProducts(products: json['product'], quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = products;
    data['quantity'] = quantity;
    return data;
  }
}
