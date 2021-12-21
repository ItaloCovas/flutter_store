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
  ObservableList<UsersModel>? usersModel;

  @action
  getUsersList() {
    api.getUsers().then((usersList) {
      usersModel = usersList;
      print('users list changed');
      print(usersModel);
    });
  }
}
