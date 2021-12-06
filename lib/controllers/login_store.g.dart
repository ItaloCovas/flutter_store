// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_LoginStore.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_LoginStore.isPasswordValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_LoginStore.isFormValid'))
          .value;
  Computed<bool>? _$isRegisterEmailValidComputed;

  @override
  bool get isRegisterEmailValid => (_$isRegisterEmailValidComputed ??=
          Computed<bool>(() => super.isRegisterEmailValid,
              name: '_LoginStore.isRegisterEmailValid'))
      .value;
  Computed<bool>? _$isUserNameValidComputed;

  @override
  bool get isUserNameValid =>
      (_$isUserNameValidComputed ??= Computed<bool>(() => super.isUserNameValid,
              name: '_LoginStore.isUserNameValid'))
          .value;
  Computed<bool>? _$isRegisterPasswordValidComputed;

  @override
  bool get isRegisterPasswordValid => (_$isRegisterPasswordValidComputed ??=
          Computed<bool>(() => super.isRegisterPasswordValid,
              name: '_LoginStore.isRegisterPasswordValid'))
      .value;
  Computed<bool>? _$isRegisterFormValidComputed;

  @override
  bool get isRegisterFormValid => (_$isRegisterFormValidComputed ??=
          Computed<bool>(() => super.isRegisterFormValid,
              name: '_LoginStore.isRegisterFormValid'))
      .value;

  final _$emailAtom = Atom(name: '_LoginStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$registerEmailAtom = Atom(name: '_LoginStore.registerEmail');

  @override
  String get registerEmail {
    _$registerEmailAtom.reportRead();
    return super.registerEmail;
  }

  @override
  set registerEmail(String value) {
    _$registerEmailAtom.reportWrite(value, super.registerEmail, () {
      super.registerEmail = value;
    });
  }

  final _$userNameAtom = Atom(name: '_LoginStore.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$registerPasswordAtom = Atom(name: '_LoginStore.registerPassword');

  @override
  String get registerPassword {
    _$registerPasswordAtom.reportRead();
    return super.registerPassword;
  }

  @override
  set registerPassword(String value) {
    _$registerPasswordAtom.reportWrite(value, super.registerPassword, () {
      super.registerPassword = value;
    });
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegisterEmail(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setRegisterEmail');
    try {
      return super.setRegisterEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserName(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setUserName');
    try {
      return super.setUserName(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegisterPassword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setRegisterPassword');
    try {
      return super.setRegisterPassword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
registerEmail: ${registerEmail},
userName: ${userName},
registerPassword: ${registerPassword},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isFormValid: ${isFormValid},
isRegisterEmailValid: ${isRegisterEmailValid},
isUserNameValid: ${isUserNameValid},
isRegisterPasswordValid: ${isRegisterPasswordValid},
isRegisterFormValid: ${isRegisterFormValid}
    ''';
  }
}