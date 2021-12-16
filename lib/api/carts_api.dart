import 'package:dio/dio.dart';
import 'package:flutter_store/model/carts_model.dart';
import 'dart:convert';

import 'package:mobx/mobx.dart';

class CartsApi {
  var dio = Dio();
  static const cartsApiUrl = 'https://fakestoreapi.com/carts?limit=5';

  Future<ObservableList<CartsModel>?> getCarts() async {
    try {
      Response response = await dio.get(cartsApiUrl);

      List<CartsModel> list =
          (response.data as List).map((e) => CartsModel.fromJson(e)).toList();

      return ObservableList<CartsModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
