import 'package:mobx/mobx.dart';
import 'package:flutter_store/api/users_api.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

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
  bool get isFormValid => isUsernameValid && isPasswordValid; // Essa computed junta as outras duas

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
    UsersApi api = UsersApi();
    api.authenticate({ 
        'username': username,
        'password': password
    });

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
  bool get isRegisterFormValid => isRegisterPasswordValid & isUserNameValid; // Essa computed junta as outras duas
}