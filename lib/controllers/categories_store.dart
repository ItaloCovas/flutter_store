import 'package:flutter_store/api/categories_api.dart';
import 'package:flutter_store/model/categories_model.dart';
import 'package:mobx/mobx.dart';
part 'categories_store.g.dart';

class CategoriesStore = _CategoriesStoreBase with _$CategoriesStore;

abstract class _CategoriesStoreBase with Store {
  CategoriesApi categoriesApi = CategoriesApi();

  @observable
  ObservableList<CategoriesApi>? categoriesProducts =
      ObservableList.of(<CategoriesApi>[]);

  @observable
  int selectedIndex = 0;

  @action
  getCategoriesList() {
    categoriesApi.getCategories().then((categoriesList) {
      categoriesProducts = categoriesList;
      print(categoriesProducts);
    });
  }
}
