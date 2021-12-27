import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_store/api/users_api.dart';
import 'package:flutter_store/model/users_model.dart';

part 'users_store.g.dart';

class UsersApiStore = _UsersApiStoreBase with _$UsersApiStore;

abstract class _UsersApiStoreBase with Store {
  UsersApi api = UsersApi();

  @observable
  UsersModel? usersModel;

  @action
  getUsersList() async {
    print('GET USERS LIST FUNCTION WAS CALLED');
    var test = await api.getUsers();
    print('GET USERS API RETURN:');
    print(test);
    // !.then((user) {
    //   print('antes');
    //   usersModel = user;
    //   print('users list changed');
    //   print(usersModel);
    // }).catchError((error) {
    //   print('USERSAPISTOREBASE ERROR:');
    //   print(error.message);
    // });
  }
}
