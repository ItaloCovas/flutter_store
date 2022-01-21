import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_store/model/categories_model.dart';
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
  Future<ObservableList<CategoriesModel>?> getEletronics() async {
    try {
      Response response = await dio.get(eletronicsApiUrl);

      List<CategoriesModel> list = (response.data as List)
          .map((e) => CategoriesModel.fromJson(e))
          .toList();

      return ObservableList<CategoriesModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ObservableList<CategoriesModel>?> getJewelery() async {
    try {
      Response response = await dio.get(jeweleryApiUrl);

      List<CategoriesModel> list = (response.data as List)
          .map((e) => CategoriesModel.fromJson(e))
          .toList();

      return ObservableList<CategoriesModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ObservableList<CategoriesModel>?> getMensClothing() async {
    try {
      Response response = await dio.get(mensclothingApiUrl);

      List<CategoriesModel> list = (response.data as List)
          .map((e) => CategoriesModel.fromJson(e))
          .toList();

      return ObservableList<CategoriesModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ObservableList<CategoriesModel>?> getWomenssClothing() async {
    try {
      Response response = await dio.get(womensclothingApiUrl);

      List<CategoriesModel> list = (response.data as List)
          .map((e) => CategoriesModel.fromJson(e))
          .toList();

      return ObservableList<CategoriesModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
