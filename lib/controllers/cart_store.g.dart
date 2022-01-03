// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStoreBase, Store {
  final _$cartProdAtom = Atom(name: '_CartStoreBase.cartProd');

  @override
  ObservableList<CartModel> get cartProd {
    _$cartProdAtom.reportRead();
    return super.cartProd;
  }

  @override
  set cartProd(ObservableList<CartModel> value) {
    _$cartProdAtom.reportWrite(value, super.cartProd, () {
      super.cartProd = value;
    });
  }

  final _$_CartStoreBaseActionController =
      ActionController(name: '_CartStoreBase');

  @override
  void addProd(ProductsModel productsModel) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.addProd');
    try {
      return super.addProd(productsModel);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartProd: ${cartProd}
    ''';
  }
}
