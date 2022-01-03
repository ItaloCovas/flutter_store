import 'package:flutter_store/api/cart_api.dart';
import 'package:flutter_store/model/carts_model.dart';
import 'package:flutter_store/model/products_model.dart';
import 'package:mobx/mobx.dart';
part 'cart_store.g.dart';

final api = CartApi();

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  var cartProd = ObservableList<CartModel>();

  void addProd(ProductsModel productsModel) {
    var prodIndex = cartProd
        .indexWhere((cartModel) => cartModel.product.id == productsModel.id);

    if (prodIndex != -1) {
      cartProd.elementAt(prodIndex).increment();
    } else {
      cartProd.add(CartModel(productsModel));
    }
    print("Produto foi add");
  }

  @computed
  ObservableList<CartModel> get ListP => cartProd;

  @computed
  double get total => cartProd
      .map((p) => double.parse(p.product.price.toString()) * p.quantity)
      .reduce((value, element) => value + element);
}
