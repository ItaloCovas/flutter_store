import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_store/controllers/prodcart_store.dart';

var dio = Dio();
const url = "https://fakestoreapi.com/carts/";
const urlUser = "https://fakestoreapi.com/users";

class CartApi {
  Future<dynamic> cart(productI) async {
    try {
      Response response = await dio.post(url, data: jsonEncode(productI));
      return response;
    } catch (e) {
      print(e);
    }
  }
}
