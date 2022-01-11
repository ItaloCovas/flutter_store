import 'package:flutter_store/model/carts_model.dart';
import 'package:flutter_store/model/products_model.dart';
import 'package:mobx/mobx.dart';
part 'carts_store.g.dart';

class CartsStore = _CartsStoreBase with _$CartsStore;

abstract class _CartsStoreBase with Store {
  @observable
  ObservableList<CartModel>? cartModel;

  @observable
  ObservableList<Products>? products;

  @observable
  double total = 0;

  @observable
  int amount = 0;

  @action
  void increment() {
    amount++;
  }

  @action
  void decrement() {
    amount <= 0 ? amount = 0 : amount--;
  }

  @action
  void getTotal(ProductsModel productsModel, Products p) {
    total += productsModel.price * p.quantity;
    print(total);
  }
}
