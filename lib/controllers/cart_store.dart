import 'package:flutter_store/model/carts_model.dart';
import 'package:flutter_store/model/products_model.dart';
import 'package:mobx/mobx.dart';
part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  @observable
  ObservableList<CartProducts>? products;

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
  void getTotal(ProductsModel productsModel, CartProducts p) {
    total += productsModel.price * p.quantity;
    // ignore: avoid_print
    print(total);
  }

  @action
  addProducts(ProductsModel productsModel) {
    var index = products!.indexWhere((p) => p.productId == productsModel.id);
    if (index > 0) {
      var update = products![index];
      update.quantity++;
      products![index] = update;
    } else {
      products!.add(addProducts(productsModel));
    }
    // ignore: avoid_print
    print("Produto foi adicionado no carrinho");
  }

  @action
  removeProducts(ProductsModel productsModel) {
    var index = products!.indexWhere((p) => p.productId == productsModel.id);
    if (index > 0) {
      products!.removeAt(index).quantity--;
    }
    // ignore: avoid_print
    print("Produto foi removido do carrinho");
  }
}
