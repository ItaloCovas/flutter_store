import 'package:flutter_store/api/cart_api.dart';
import 'package:flutter_store/model/carts_model.dart';
import 'package:flutter_store/model/products_model.dart';
import 'package:mobx/mobx.dart';
part 'carts_store.g.dart';

class CartsStore = _CartsStoreBase with _$CartsStore;

abstract class _CartsStoreBase with Store {
  CartApi api = CartApi();

  @observable
  ObservableList<CartModel>? cartModel;

  @observable
  bool loading = false;

  @observable
  double total = 0;

  @action
  void getTotal(ProductsModel productsModel, Products p) {
    loading = true;
    total += productsModel.price * p.quantity;
    print(total);
    loading = false;
  }

  @computed
  ObservableList<CartModel>? get listProd => cartModel;

  @action
  void getCartList() async {
    loading = true;
    api.getProdCart().then((cartsList) {
      return cartModel = cartsList;
    });
    print('products list changed');
    print(cartModel);
  }
}
