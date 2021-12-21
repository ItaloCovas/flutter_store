import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/pages/home_page.dart';
import 'package:flutter_store/pages/login_page.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_store/api/login_api.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  LoginApi api = LoginApi();

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

  @action
  Future<void> login() async {
    loading = true;

    // PROCESSO
    var r = await api.authenticate({
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
      navigatorPlus.show(HomePage());
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
