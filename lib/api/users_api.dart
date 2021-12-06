import 'package:dio/dio.dart';

var dio = Dio();

void getHttp() async {
  try {
    var response = await dio.get('https://fakestoreapi.com/auth/login');
    print(response);
  } catch (e) {
    print(e);
  }
}