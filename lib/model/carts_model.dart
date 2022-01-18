import 'package:flutter_store/model/products_model.dart';

class CartProducts {
  ProductsModel products;
  int quantity;

  CartProducts({required this.products, required this.quantity});

  factory CartProducts.fromJson(Map<String, dynamic> json) {
    return CartProducts(products: json['product'], quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product'] = products;
    data['quantity'] = quantity;
    return data;
  }
}
