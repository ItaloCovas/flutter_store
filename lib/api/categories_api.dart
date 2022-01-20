import 'dart:convert';
import 'package:dio/dio.dart';

var dio = Dio();
const eletronicsApiUrl =
    "https://fakestoreapi.com/products/category/electronics";
const jeweleryApiUrl = "https://fakestoreapi.com/products/category/jewelery";
const mensclothingApiUrl =
    "https://fakestoreapi.com/products/category/men's%20clothing";
const womensclothingApiUrl = "";

class CategoriesApi {
  Future<dynamic> getCategoryEletronics() async {
    try {
      Response response = await dio.get(eletronicsApiUrl);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getCategoryJewelery() async {
    try {
      Response response = await dio.get(jeweleryApiUrl);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getCategoryMensClothing() async {
    try {
      Response response = await dio.get(mensclothingApiUrl);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getCategoryWomenssClothing() async {
    try {
      Response response = await dio.get(womensclothingApiUrl);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
