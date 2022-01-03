import 'dart:convert';
import 'package:dio/dio.dart';

var dio = Dio();
const url = "https://fakestoreapi.com/auth/login";
const url2 = "https://fakestoreapi.com/users";

class LoginApi {
  Future<dynamic> authenticate(user) async {
    try {
      Response response = await dio.post(url, data: jsonEncode(user));
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> registerNewUser(user) async {
    try {
      Response response = await dio.post(url2, data: jsonEncode(user));
      return response;
    } catch (e) {
      print(e);
    }
  }
}
