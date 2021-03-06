// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeApiStore on _HomeApiStoreBase, Store {
  final _$productsModelAtom = Atom(name: '_HomeApiStoreBase.productsModel');

  @override
  ObservableList<ProductsModel>? get productsModel {
    _$productsModelAtom.reportRead();
    return super.productsModel;
  }

  @override
  set productsModel(ObservableList<ProductsModel>? value) {
    _$productsModelAtom.reportWrite(value, super.productsModel, () {
      super.productsModel = value;
    });
  }

  final _$selectedIndexAtom = Atom(name: '_HomeApiStoreBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$_HomeApiStoreBaseActionController =
      ActionController(name: '_HomeApiStoreBase');

  @override
  dynamic getProductsList() {
    final _$actionInfo = _$_HomeApiStoreBaseActionController.startAction(
        name: '_HomeApiStoreBase.getProductsList');
    try {
      return super.getProductsList();
    } finally {
      _$_HomeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getEletronicList() {
    final _$actionInfo = _$_HomeApiStoreBaseActionController.startAction(
        name: '_HomeApiStoreBase.getEletronicList');
    try {
      return super.getEletronicList();
    } finally {
      _$_HomeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getJeweleryList() {
    final _$actionInfo = _$_HomeApiStoreBaseActionController.startAction(
        name: '_HomeApiStoreBase.getJeweleryList');
    try {
      return super.getJeweleryList();
    } finally {
      _$_HomeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productsModel: ${productsModel},
selectedIndex: ${selectedIndex}
    ''';
  }
}
