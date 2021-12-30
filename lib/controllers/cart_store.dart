import 'dart:ffi';

import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/controllers/home_store.dart';
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
  ObservableList<CartsModel>? cartModel;

  @observable
  int userId = 0;

  
  @observable
  int prodCart = 0;

  @observable
  bool loading = false;

  @observable
  double total = 0;

  @observable
  int id = 0;

  @action
  void setuser(int value) => userId = value;

  @action
  void setid(int value) => id = value;

  @action


  @action
  getCartsList() {
    loading = true;
    api.getCarts().then((cartsList) {
      for (var i = 0; i < cartsList!.length; i++) {
        var product = api.getProductsCart(cartsList[i]);
        total += product["price"] * cartsList[i];
        cartModel!.add(product);
      }
    });
    loading = false;
    print('carts list changed');
    print(cartModel);
    print(total);
  }
}
