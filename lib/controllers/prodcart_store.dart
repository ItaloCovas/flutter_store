import 'package:flutter_store/controllers/cart_store.dart';
import 'package:flutter_store/model/carts_model.dart';
import 'package:flutter_store/model/products_model.dart';
import 'package:mobx/mobx.dart';
part 'prodcart_store.g.dart';

class ProdCart = _ProdCartBase with _$ProdCart;

abstract class _ProdCartBase with Store {
  final CartStore _cartStore;

  @observable
  _ProdCartBase(this._cartStore);

  @action
  void addProd(productsModel) {
    _cartStore.addProd(productsModel);
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
