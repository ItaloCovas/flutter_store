// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStoreBase, Store {
  final _$productsAtom = Atom(name: '_CartStoreBase.products');

  @override
  ObservableList<CartProducts>? get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<CartProducts>? value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$totalAtom = Atom(name: '_CartStoreBase.total');

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

  final _$amountAtom = Atom(name: '_CartStoreBase.amount');

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

  final _$addProductsAsyncAction = AsyncAction('_CartStoreBase.addProducts');

  @override
  Future addProducts(ProductsModel productsModel) {
    return _$addProductsAsyncAction.run(() => super.addProducts(productsModel));
  }

  final _$_CartStoreBaseActionController =
      ActionController(name: '_CartStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getTotal() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.getTotal');
    try {
      return super.getTotal();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeProducts(ProductsModel productsModel) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.removeProducts');
    try {
      return super.removeProducts(productsModel);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearCart() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.clearCart');
    try {
      return super.clearCart();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
total: ${total},
amount: ${amount}
    ''';
  }
}
