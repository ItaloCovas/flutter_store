import 'package:dio/dio.dart';
import 'package:flutter_store/controllers/login_store.dart';
import 'package:flutter_store/model/users_model.dart';
import 'package:get_it/get_it.dart';

final loginStore = GetIt.I.get<LoginStore>();

class UsersApi {
  Future<UsersModel?>? getUsers() async {
    var dio = Dio();
    var url = "https://fakestoreapi.com/users/${loginStore.userId}";
    try {
      Response response = await dio.get(url);
      UsersModel? user = UsersModel.fromJson(response.data);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
