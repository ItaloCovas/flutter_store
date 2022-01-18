import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/widgets/home_page.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_store/api/login_api.dart';
part 'login_store.g.dart';

final api = LoginApi();

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  LoginStore() {
    checkUserId() async {
      if (await localStoragePlus.containsKey('user_id')) {
        assignId();
      }
    }

    checkUserId();
  }

  // ******* PARTE DO LOGIN ************
  @observable
  String username = "";

  @action
  void setUser(String value) => username = value; //Setando email

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value; //Setando senha

  @computed
  bool get isUsernameValid => username.isNotEmpty;

  @computed
  bool get isPasswordValid => password.isNotEmpty;

  @computed
  bool get isFormValid =>
      isUsernameValid && isPasswordValid; // Essa computed junta as outras duas

  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool loading = false;

  @observable
  int userId = 0;

  //Verificação de username para poder atribuir um ID e futuramente capturar os dados desse user
  @action
  assignId() async {
    switch (username) {
      case 'johnd':
        userId = 1;
        break;
      case 'mor_2314"':
        userId = 2;
        break;
      case 'kevinryan':
        userId = 3;
        break;
      case 'donero':
        userId = 4;
        break;
      case 'derek':
        userId = 5;
        break;
      case 'david_r':
        userId = 6;
        break;
      case 'snyder':
        userId = 7;
        break;
      case 'hopkins':
        userId = 8;
        break;
      case 'kate_h':
        userId = 9;
        break;
      case 'jimmie_k':
        userId = 10;
        break;
      default:
        userId = 0;
        break;
    }
    return userId;
  }

  @observable
  var r;

  @action
  login() async {
    loading = true;

    // PROCESSO
    r = await api.authenticate({
      'username': username,
      'password': password,
    });

    //Verificação de erro da requisição
    if (r.data['status'] == "Error") {
      loading = false;
      dialogPlus.showDefault(
          title: 'ERRO',
          message: "Erro no Login! Confira seus dados e tente novamente.",
          elementsSpacing: 16,
          buttonOneText: 'Tentar novamente',
          buttonOneColor: Colors.red,
          buttonOneCallback: () {
            navigatorPlus.back();
          });
      return;
    } else {
      assignId();
      await localStoragePlus.write('user_id', userId);
      await localStoragePlus.write('user_login', jsonEncode(r.data));
      navigatorPlus.show(const HomePage());
    }
    loading = false;
  }

  // ******* PARTE DO REGISTRO ************

  @observable
  String userName = "";

  @action
  void setUserName(String value) => userName = value;

  @observable
  String registerPassword = "";

  @action
  void setRegisterPassword(String value) => registerPassword = value;

  @computed
  bool get isUserNameValid => userName.isNotEmpty;

  @computed
  bool get isRegisterPasswordValid => registerPassword.isNotEmpty;

  @computed
  bool get isRegisterFormValid =>
      isRegisterPasswordValid &
      isUserNameValid; // Essa computed junta as outras duas

  @action
  Future<void> register() async {
    loading = true;

    // PROCESSO
    var r = await api.registerNewUser({
      'email': 'John@gmail.com',
      'username': userName,
      'password': password,
      'name': {'firstname': 'John', 'lastname': 'Doe'},
      'address': {
        'city': 'kilcoole',
        'street': '7835 new road',
        'number': 3,
        'zipcode': '12926-3874',
        'geolocation': {'lat': '-37.3159', 'long': '81.1496'}
      },
      'phone': '1-570-236-7033'
    });

    //Verificação de erro da requisição
    if (r.data['status'] == "Error") {
      loading = false;
      dialogPlus.showDefault(
          title: 'ERRO',
          message: "Erro no Registro! Confira seus dados e tente novamente.",
          elementsSpacing: 16,
          buttonOneText: 'Tentar novamente',
          buttonOneColor: Colors.red,
          buttonOneCallback: () {
            navigatorPlus.back();
          });
      return;
    } else {
      loading = false;
      dialogPlus.showDefault(
          title: 'SUCESSO',
          message: "Usuário registrado com sucesso!",
          elementsSpacing: 16,
          buttonOneText: 'OK',
          buttonOneColor: Colors.green,
          buttonOneCallback: () {
            navigatorPlus.back();
          });
    }

    loading = false;
  }
}
