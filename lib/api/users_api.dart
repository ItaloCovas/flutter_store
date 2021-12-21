import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_store/model/users_model.dart';
import 'package:mobx/mobx.dart';


class UsersApi {
  var dio = Dio();
  var url = "https://fakestoreapi.com/users/1";

  Future<ObservableList<UsersModel>?> getUsers() async {
    try {
      Response response = await dio.get(url);

      List<UsersModel> list = (response.data as List)
          .map((e) => UsersModel.fromJson(e))
          .toList();

      return ObservableList<UsersModel>.of(list);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
