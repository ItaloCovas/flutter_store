import 'package:dio/dio.dart';
import 'package:flutter_store/model/products_model.dart';

class ProductsApi{
ProductsApi._internal();
static ProductsApi _instance = ProductsApi._internal();
static ProductsApi get instance => _instance;

final _dio = Dio();

Future<List<ProductsModel>?> getProducts() async{
  try{
     final Response response = await this._dio.get('https://fakestoreapi.com/products');
     return (response.data['data'] as List)
         .map((e) => ProductsModel.fromJson(e))
         .toList();

  }catch (e){
     print(e);
     return null;
  }
}
}
