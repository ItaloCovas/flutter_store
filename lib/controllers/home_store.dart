import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/model/products_model.dart';

part 'home_store.g.dart';

class HomeApiStore = _HomeApiStoreBase with _$HomeApiStore;

abstract class _HomeApiStoreBase with Store {
  ProductsApi api = ProductsApi();

  @observable
  ObservableList<ProductsModel>? productsModel;

  @action
  getProductsList() {
    api.getProducts().then((productsList) {
      productsModel = productsList as ObservableList<ProductsModel>?;
      print('products list changed');
      print(productsModel);
    });
  }
}
