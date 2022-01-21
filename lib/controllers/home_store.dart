import 'package:flutter_store/api/categories_api.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/model/products_model.dart';

part 'home_store.g.dart';

class HomeApiStore = _HomeApiStoreBase with _$HomeApiStore;

abstract class _HomeApiStoreBase with Store {
  ProductsApi api = ProductsApi();
  CategoriesApi categoriesApi = CategoriesApi();

  @observable
  ObservableList<ProductsModel>? productsModel;

  @action
  getProductsList() {
    api.getProducts().then((productsList) {
      productsModel = productsList;
      print('products list changed');
      print(productsModel);
    });
  }

  @action
  getEletronicList() {
    categoriesApi.getEletronics().then((eletronicsList) {
      productsModel = eletronicsList;
      print(productsModel);
    });
  }

  @action
  getJeweleryList() {
    categoriesApi.getJewelery().then((jeweleryList) {
      productsModel = jeweleryList;
      print(productsModel);
    });
  }

  @action
  getMensClothingList() {
    categoriesApi.getMensClothing().then((mensClothingList) {
      productsModel = mensClothingList;
      print(productsModel);
    });
  }

  @action
  getWomenssClothingList() {
    categoriesApi.getWomenssClothing().then((womenssClothingList) {
      productsModel = womenssClothingList;
      print(productsModel);
    });
  }

  @observable
  int selectedIndex = 0;
}
