import 'dart:convert';
import 'package:dio/dio.dart';


var dio = Dio();
const url = "https://fakestoreapi.com/auth/login";

class UsersApi {
  Future<dynamic> authenticate(user) async {
  try {
    Response response = await dio.post(url, data: jsonEncode(user));
    print(response);
    return response;
  } catch (e) {
    print(e);
  }
}
}