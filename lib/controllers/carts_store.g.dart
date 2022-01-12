// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartsStore on _CartsStoreBase, Store {
  final _$cartModelAtom = Atom(name: '_CartsStoreBase.cartModel');

  @override
  ObservableList<CartModel>? get cartModel {
    _$cartModelAtom.reportRead();
    return super.cartModel;
  }

  @override
  set cartModel(ObservableList<CartModel>? value) {
    _$cartModelAtom.reportWrite(value, super.cartModel, () {
      super.cartModel = value;
    });
  }

  final _$productsAtom = Atom(name: '_CartsStoreBase.products');

  @override
  ObservableList<Products>? get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<Products>? value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$totalAtom = Atom(name: '_CartsStoreBase.total');

  @override
  double get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(double value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  final _$amountAtom = Atom(name: '_CartsStoreBase.amount');

  @override
  int get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(int value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  final _$_CartsStoreBaseActionController =
      ActionController(name: '_CartsStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_CartsStoreBaseActionController.startAction(
        name: '_CartsStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CartsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CartsStoreBaseActionController.startAction(
        name: '_CartsStoreBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CartsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getTotal(ProductsModel productsModel, Products p) {
    final _$actionInfo = _$_CartsStoreBaseActionController.startAction(
        name: '_CartsStoreBase.getTotal');
    try {
      return super.getTotal(productsModel, p);
    } finally {
      _$_CartsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartModel: ${cartModel},
products: ${products},
total: ${total},
amount: ${amount}
    ''';
  }
}
