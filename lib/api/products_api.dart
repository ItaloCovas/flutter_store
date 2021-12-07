import 'package:dio/dio.dart';
import 'package:flutter_store/model/products_model.dart';

class ProductsApi {
  final url = 'https://fakestoreapi.com/products';
  final dio = Dio();

  Future<List<ProductsModel>> getProducts() async {
    final response = await dio.get(url);
    final body = response.data as List;
    final products = body
        .map(
          (map) => ProductsModel(
            id: map['id'],
            title: map['title'],
            price: map['price'],
            category: map['category'],
            description: map['description'],
            image: map['image'],
          ),
        )
        .toList();

    return products;
  }
}
