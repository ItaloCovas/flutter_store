import 'package:flutter_store/api/products_api.dart';

class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;

  ProductsModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.image});

  Future<List<ProductsModel>> getProducts() async {
    final response = await dio.get('https://fakestoreapi.com/products');
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
