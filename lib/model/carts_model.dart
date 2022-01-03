import 'package:flutter_store/model/products_model.dart';
import 'package:mobx/mobx.dart';
part 'carts_model.g.dart';

class CartModel = _CartModelBase with _$CartModel;

abstract class _CartModelBase with Store {
  final ProductsModel product;

  @observable
  int _quantity = 1;

  @computed
  int get quantity => _quantity;

  _CartModelBase(this.product);

  @action
  void increment() {
    _quantity++;
  }

  @action
  void decrement() {
    _quantity++;
  }
}
