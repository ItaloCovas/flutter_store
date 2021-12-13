// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeApiStore on _HomeApiStoreBase, Store {
  Computed<ProductsModel>? _$productsapiComputed;

  @override
  ProductsModel get productsapi => (_$productsapiComputed ??=
          Computed<ProductsModel>(() => super.productsapi,
              name: '_HomeApiStoreBase.productsapi'))
      .value;

  final _$_productsModelAtom = Atom(name: '_HomeApiStoreBase._productsModel');

  @override
  ProductsModel get _productsModel {
    _$_productsModelAtom.reportRead();
    return super._productsModel;
  }

  @override
  set _productsModel(ProductsModel value) {
    _$_productsModelAtom.reportWrite(value, super._productsModel, () {
      super._productsModel = value;
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
productsapi: ${productsapi}
    ''';
  }
}
