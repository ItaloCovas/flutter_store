import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_store/model/products_model.dart';
import 'package:mobx/mobx.dart';

var dio = Dio();
const eletronicsApiUrl =
    "https://fakestoreapi.com/products/category/electronics";
const jeweleryApiUrl = "https://fakestoreapi.com/products/category/jewelery";
const mensclothingApiUrl =
    "https://fakestoreapi.com/products/category/men's%20clothing";
const womensclothingApiUrl =
    "https://fakestoreapi.com/products/category/women's%20clothing";

class CategoriesApi {
  Future<ObservableList<ProductsModel>?> getEletronics() async {
    try {
      Response response = await dio.get(eletronicsApiUrl);

      List<ProductsModel> list = (response.data as List)
          .map((e) => ProductsModel.fromJson(e))
          .toList();

      return ObservableList<ProductsModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ObservableList<ProductsModel>?> getJewelery() async {
    try {
      Response response = await dio.get(jeweleryApiUrl);

      List<ProductsModel> list = (response.data as List)
          .map((e) => ProductsModel.fromJson(e))
          .toList();

      return ObservableList<ProductsModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ObservableList<ProductsModel>?> getMensClothing() async {
    try {
      Response response = await dio.get(mensclothingApiUrl);

      List<ProductsModel> list = (response.data as List)
          .map((e) => ProductsModel.fromJson(e))
          .toList();

      return ObservableList<ProductsModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ObservableList<ProductsModel>?> getWomenssClothing() async {
    try {
      Response response = await dio.get(womensclothingApiUrl);

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
