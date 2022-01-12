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

  @action
  addProducts(ProductsModel productsModel) {
    var index = products!.indexWhere((p) => p.productId == productsModel.id);
    if (index <= 0) {
      var update = products![index];
      update.quantity++;
      products![index] = update;
    } else {
      products!.add(addProducts(productsModel));
    }
    print("Produto foi adicionado no carrinho");
  }

  @action
  removeProducts(ProductsModel productsModel) {
    var index = products!.indexWhere((p) => p.productId == productsModel.id);
    if (index <= 0) {
      products!.removeAt(index).quantity--;
    }
    print("Produto foi removido do carrinho");
  }
}
