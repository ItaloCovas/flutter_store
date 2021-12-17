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

  final _$valueAtom = Atom(name: '_HomeApiStoreBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
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
  void increment() {
    final _$actionInfo = _$_HomeApiStoreBaseActionController.startAction(
        name: '_HomeApiStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_HomeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_HomeApiStoreBaseActionController.startAction(
        name: '_HomeApiStoreBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_HomeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectTab(dynamic index) {
    final _$actionInfo = _$_HomeApiStoreBaseActionController.startAction(
        name: '_HomeApiStoreBase.selectTab');
    try {
      return super.selectTab(index);
    } finally {
      _$_HomeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productsModel: ${productsModel},
value: ${value},
selectedIndex: ${selectedIndex}
    ''';
  }
}
