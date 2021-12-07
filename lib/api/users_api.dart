import 'dart:convert';
import 'package:dio/dio.dart';


var dio = Dio();
const url = "https://fakestoreapi.com/auth/login";

class UsersApi {
  void authenticate(user) async {
  try {
    Response response = await dio.post(url, data: jsonEncode(user));
  } catch (e) {
    print(e);
  }
}
}