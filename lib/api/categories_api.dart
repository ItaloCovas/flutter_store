import 'dart:convert';
import 'package:dio/dio.dart';

var dio = Dio();
const categoriesApiUrl = "https://fakestoreapi.com/products/categories";
const categoryEApiUrl =
    "https://fakestoreapi.com/products/category/electronics";

class CategoriesApi {
  Future<dynamic> getCategories() async {
    try {
      Response response = await dio.get(categoriesApiUrl);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
