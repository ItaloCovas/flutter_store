import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  // ******* PARTE DO LOGIN ************
  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value; //Setando email

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value; //Setando senha

  @computed
  bool get isEmailValid => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 8;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid; // Essa computed junta as outras duas

  // ******* PARTE DO REGISTRO ************
  @observable
  String registerEmail = "";

  @action
  void setRegisterEmail(String value) => registerEmail = value; 

  @observable
  String userName = "";

  @action
  void setUserName(String value) => userName = value;

  @observable
  String registerPassword = "";

  @action
  void setRegisterPassword(String value) => registerPassword = value; 

  @computed
  bool get isRegisterEmailValid => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(registerEmail);

  @computed
  bool get isUserNameValid => userName.length >=8;

  @computed
  bool get isRegisterPasswordValid => registerPassword.length >= 8;

  @computed
  bool get isRegisterFormValid => isRegisterEmailValid && isRegisterPasswordValid & isUserNameValid; // Essa computed junta as outras duas


}