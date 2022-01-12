import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:meta/meta.dart';

class CartProducts {
  int productId;
  int quantity;

  CartProducts({required this.productId, required this.quantity});

  factory CartProducts.fromJson(Map<String, dynamic> json) {
    return CartProducts(
        productId: json['productId'], quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['productId'] = productId;
    data['quantity'] = quantity;
    return data;
  }
}
