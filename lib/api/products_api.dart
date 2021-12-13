import 'package:dio/dio.dart';
import 'package:flutter_store/model/products_model.dart';
import 'dart:convert';

import 'package:mobx/mobx.dart';

class ProductsApi {
  var dio = Dio();
  static const productsApiUrl = 'https://fakestoreapi.com/products';

  Future<List<ProductsModel>?> getProducts() async {
    try {
      Response response = await dio.get(productsApiUrl);
      return (response.data['products'] as ObservableList)
          .map((e) => ProductsModel.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
