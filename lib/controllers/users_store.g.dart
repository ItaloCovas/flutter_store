// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersApiStore on _UsersApiStoreBase, Store {
  final _$usersModelAtom = Atom(name: '_UsersApiStoreBase.usersModel');

  @override
  UsersModel? get usersModel {
    _$usersModelAtom.reportRead();
    return super.usersModel;
  }

  @override
  set usersModel(UsersModel? value) {
    _$usersModelAtom.reportWrite(value, super.usersModel, () {
      super.usersModel = value;
    });
  }

  final _$getUsersListAsyncAction =
      AsyncAction('_UsersApiStoreBase.getUsersList');

  @override
  Future<void> getUsersList() {
    return _$getUsersListAsyncAction.run(() => super.getUsersList());
  }

  @override
  String toString() {
    return '''
usersModel: ${usersModel}
    ''';
  }
}
