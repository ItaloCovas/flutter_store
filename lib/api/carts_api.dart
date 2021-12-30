import 'package:dio/dio.dart';
import 'package:flutter_store/model/carts_model.dart';
import 'dart:convert';

import 'package:mobx/mobx.dart';

class CartsApi {
  var dio = Dio();
  static const cartsApiUrl = 'https://fakestoreapi.com/carts/1';
  static const cartsProdApiUrl = 'https://fakestoreapi.com/products/';

  getProductsCart(productsId) async {
    Response response = await dio.get(cartsApiUrl + productsId.toString());
    return json.decode(response.data);
  }

  Future<ObservableList<CartsModel>?> getCarts() async {
    Response response = await dio.get(cartsApiUrl);
    var productsJson = json.decode(response.data);
    var products = productsJson["products"];
    print(products);
  }
}
