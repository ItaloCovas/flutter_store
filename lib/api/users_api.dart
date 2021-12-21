import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_store/controllers/login_store.dart';
import 'package:flutter_store/model/users_model.dart';
import 'package:mobx/mobx.dart';

LoginStore loginStore = LoginStore();

class UsersApi {
  var dio = Dio();
  var url = "https://fakestoreapi.com/users/${loginStore.userId}";

  Future<UsersModel?>? getUsers() async {
    try {
      Response response = await dio.get(url);
      UsersModel user = UsersModel.fromJson(response.data);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
