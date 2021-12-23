// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStoreBase, Store {
  final _$userIdAtom = Atom(name: '_CartStoreBase.userId');

  @override
  int get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(int value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  final _$cartsModelAtom = Atom(name: '_CartStoreBase.cartsModel');

  @override
  ObservableList<CartsModel>? get cartsModel {
    _$cartsModelAtom.reportRead();
    return super.cartsModel;
  }

  @override
  set cartsModel(ObservableList<CartsModel>? value) {
    _$cartsModelAtom.reportWrite(value, super.cartsModel, () {
      super.cartsModel = value;
    });
  }

  final _$idAtom = Atom(name: '_CartStoreBase.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$_CartStoreBaseActionController =
      ActionController(name: '_CartStoreBase');

  @override
  void setuser(int value) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.setuser');
    try {
      return super.setuser(value);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setid(int value) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.setid');
    try {
      return super.setid(value);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addProd(ProductsModel productsModel, int quantity) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.addProd');
    try {
      return super.addProd(productsModel, quantity);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void RemoveProd(ProductsModel productsModel, int quantity) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.RemoveProd');
    try {
      return super.RemoveProd(productsModel, quantity);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCartsList() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.getCartsList');
    try {
      return super.getCartsList();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userId: ${userId},
cartsModel: ${cartsModel},
id: ${id}
    ''';
  }
}
