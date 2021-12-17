import 'dart:ffi';

import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/model/products_model.dart';
import 'package:mobx/mobx.dart';
import 'dart:collection';
import 'package:flutter_store/api/carts_api.dart';
import 'package:flutter_store/model/carts_model.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  CartsApi api = CartsApi();

  @observable
  int _quantity = 1;

  @computed
  int get quantity => _quantity;

  @action
  void increment() {
    _quantity++;
  }

  @action
  decrement() {
    _quantity--;
  }

  @observable
  int userId = 0;

  @action
  void setuser(int value) => userId = value;

  @observable
  int id = 0;

  @action
  void setid(int value) => id = value;

  @observable
  ObservableList<CartsModel>? cartsModel;

  @action
  getCartsList() {
    api.getCarts().then((cartsList) {
      cartsModel = cartsList;
      print('carts list changed');
      print(cartsModel);
    });
  }
}