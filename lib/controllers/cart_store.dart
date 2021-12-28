import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/controllers/home_store.dart';
import 'package:flutter_store/model/products_model.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'dart:collection';
import 'package:flutter_store/api/carts_api.dart';
import 'package:flutter_store/model/carts_model.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  CartsApi api = CartsApi();

  @observable
  int userId = 0;

  @observable
  bool loading = false;

  @observable
  ObservableList<CartsModel>? cartsModel;

  @observable
  int id = 0;

  @action
  void setuser(int value) => userId = value;

  @action
  void setid(int value) => id = value;

  @action
  void addProd(ProductsModel productsModel, int quantity) {
    loading = true;
    int indexProd =
        cartsModel!.indexWhere((cart) => cart.id == productsModel.id);
    if (indexProd != -1) {
      var updadte = cartsModel![indexProd];
      updadte.id++;
      cartsModel![indexProd] = updadte;
    } else {
      addProd(productsModel, quantity) {
        cartsModel!.add(productsModel);
      }
    }
    print('Produto foi adicionado');
  }

  @action
  void RemoveProd(ProductsModel productsModel, int quantity) {
    int indexProd =
        cartsModel!.indexWhere((cart) => cart.id == productsModel.id);

    if (indexProd != -1) {
      cartsModel!.removeAt(indexProd);
    }
    print('Produto foi removido');
  }

  @action
  getCartsList() {
    loading = true;
    api.getCarts().then((cartsList) {
      cartsModel = cartsList;
      print('carts list changed');
      print(cartsModel);
    });
  }
}
