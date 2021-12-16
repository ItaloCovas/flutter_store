// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStoreBase, Store {
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

  final _$_CartStoreBaseActionController =
      ActionController(name: '_CartStoreBase');

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
cartsModel: ${cartsModel}
    ''';
  }
}
