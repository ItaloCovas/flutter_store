import 'package:dio/dio.dart';
import 'package:flutter_store/model/products_model.dart';

var dio = Dio();

void getProducs() async {
  try {
    var response = await dio.get('https://fakestoreapi.com/products');
    print(response);
  } catch (e) {
    print(e);
  }
}
