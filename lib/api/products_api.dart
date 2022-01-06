import 'package:dio/dio.dart';
import 'package:flutter_store/model/products_model.dart';
import 'dart:convert';

import 'package:mobx/mobx.dart';

class ProductsApi {
  var dio = Dio();
  static const productsApiUrl = 'https://fakestoreapi.com/products?limit=10';
  Future<ObservableList<ProductsModel>?> getProducts() async {
    try {
      Response response = await dio.get(productsApiUrl);

      List<ProductsModel> list = (response.data as List)
          .map((e) => ProductsModel.fromJson(e))
          .toList();

      return ObservableList<ProductsModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
