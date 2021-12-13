import 'package:mobx/mobx.dart';

import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/api/users_api.dart';
import 'package:flutter_store/model/products_model.dart';

part 'home_store.g.dart';

class HomeApiStore = _HomeApiStoreBase with _$HomeApiStore;

abstract class _HomeApiStoreBase with Store {
  @observable
  late ProductsModel _productsModel;

  @computed
  ProductsModel get productsapi => _productsModel;

  @action
  getProductsList() {
    getProducts().then((productsList) {
      _productsModel = productsList as ProductsModel;
    });
  }

  Future<List<ProductsModel>?> getProducts() async {
    try {
      final response = await dio.get(ProductsApi.productsApiUrl);
      return (response.data['products'] as List)
          .map((products) => ProductsModel.fromJson(products))
          .toList();
    } catch (products) {
      print(products);
      return null;
    }
  }
}
