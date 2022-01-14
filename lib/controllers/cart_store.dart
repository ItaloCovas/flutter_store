import 'package:flutter_store/model/carts_model.dart';
import 'package:flutter_store/model/products_model.dart';
import 'package:mobx/mobx.dart';
part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  @observable
  ObservableList<CartProducts>? products = ObservableList.of(<CartProducts>[]);

  @observable
  double total = 0.0;

  @observable
  int amount = 1;

  @action
  void increment() {
    amount++;
  }

  @action
  void decrement() {
    amount <= 1 ? amount = 1 : amount--;
  }

  @action
  void getTotal(ProductsModel productsModel) {
    for (var item in products!) {
      total += item.products.price * item.quantity;
    }
  }

  @action
  addProducts(ProductsModel productsModel) {
    var index = products!.indexWhere((p) => p.products.id == productsModel.id);
    if (index >= 0) {
      products!.elementAt(index).quantity += amount;
    } else {
      products!.add(CartProducts(products: productsModel, quantity: amount));
    }
    for (var item in products as List) {
      print('Id: ' +
          item.products.id.toString() +
          ' | ' +
          'quantity: ' +
          item.quantity.toString());
    }
  }

  @action
  removeProducts(ProductsModel productsModel) {
    var index = products!.indexWhere((p) => p.products.id == productsModel.id);
    if (index >= 0) {
      products!.removeAt(index).quantity--;
    }
    print("Produto foi removido do carrinho");
  }

  @action
  clearCart() {
    products = ObservableList.of(<CartProducts>[]);
    total = 0;
  }
}
