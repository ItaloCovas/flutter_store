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

  final _$loadingAtom = Atom(name: '_HomeApiStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
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
  String toString() {
    return '''
productsModel: ${productsModel},
loading: ${loading}
    ''';
  }
}
