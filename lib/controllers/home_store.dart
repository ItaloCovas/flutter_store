import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/model/products_model.dart';

part 'home_store.g.dart';

class HomeApiStore = _HomeApiStoreBase with _$HomeApiStore;

abstract class _HomeApiStoreBase with Store {
  ProductsApi api = ProductsApi();

  @observable
  ProductsModel? _productsModel;

  @computed
  ProductsModel? get productsapi => _productsModel;

  @action
  getProductsList() {
    api.getProducts().then((productsList) {
      _productsModel = productsList as ProductsModel;
    });
  }

}
