// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carts_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartModel on _CartModelBase, Store {
  Computed<int>? _$quantityComputed;

  @override
  int get quantity => (_$quantityComputed ??=
          Computed<int>(() => super.quantity, name: '_CartModelBase.quantity'))
      .value;

  final _$_quantityAtom = Atom(name: '_CartModelBase._quantity');

  @override
  int get _quantity {
    _$_quantityAtom.reportRead();
    return super._quantity;
  }

  @override
  set _quantity(int value) {
    _$_quantityAtom.reportWrite(value, super._quantity, () {
      super._quantity = value;
    });
  }

  final _$_CartModelBaseActionController =
      ActionController(name: '_CartModelBase');

  @override
  void increment() {
    final _$actionInfo = _$_CartModelBaseActionController.startAction(
        name: '_CartModelBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CartModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CartModelBaseActionController.startAction(
        name: '_CartModelBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CartModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantity: ${quantity}
    ''';
  }
}
