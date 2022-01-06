import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_store/model/carts_model.dart';
import 'package:mobx/mobx.dart';

var dio = Dio();
const cartApiUrl = "https://fakestoreapi.com/carts/1";
const prodApiUrl = "https://fakestoreapi.com/products/";

class CartApi {
  Future<ObservableList<CartModel>?> getCart(productId) async {
    try {
      Response response = await dio.get(cartApiUrl + productId.toString());

      List<CartModel> list =
          (response.data as List).map((e) => CartModel.fromJson(e)).toList();

      return ObservableList<CartModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ObservableList<CartModel>?> getProdCart() async {
    try {
      Response response = await dio.get(cartApiUrl);

      List<CartModel> prodJ = (response.data as List)
          .map((products) => CartModel.fromJson(products))
          .toList();

      return ObservableList<CartModel>.of(prodJ);
    } catch (products) {
      print(products);
      return null;
    }
  }
}
