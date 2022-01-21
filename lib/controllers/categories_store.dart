import 'package:flutter_store/api/categories_api.dart';
import 'package:flutter_store/model/categories_model.dart';
import 'package:flutter_store/model/products_model.dart';
import 'package:mobx/mobx.dart';
part 'categories_store.g.dart';

class CategoriesStore = _CategoriesStoreBase with _$CategoriesStore;

abstract class _CategoriesStoreBase with Store {
  CategoriesApi categoriesApi = CategoriesApi();

  @observable
  ObservableList<CategoriesModel>? categoriesModel;

  @observable
  int selectedIndex = 0;

  @action
  getEletronicList() {
    categoriesApi.getEletronics().then((eletronicsList) {
      categoriesModel = eletronicsList;
      print(categoriesModel);
    });
  }

  @action
  getJeweleryList() {
    categoriesApi.getJewelery().then((jeweleryList) {
      categoriesModel = jeweleryList;
      print(categoriesModel);
    });
  }

  @action
  getMensClothingList() {
    categoriesApi.getMensClothing().then((mensClothingList) {
      categoriesModel = mensClothingList;
      print(categoriesModel);
    });
  }

  @action
  getWomenssClothingList() {
    categoriesApi.getWomenssClothing().then((womenssClothingList) {
      categoriesModel = womenssClothingList;
      print(categoriesModel);
    });
  }
}
