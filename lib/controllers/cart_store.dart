import 'package:flutter/rendering.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_store/api/carts_api.dart';
import 'package:flutter_store/model/carts_model.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  CartsApi api = CartsApi();

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
