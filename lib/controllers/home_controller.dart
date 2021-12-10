import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/model/products_model.dart';

class HomeController extends GetxController{
  bool _loading = true;
  bool get loading => _loading;

  List<ProductsModel> _products = [];
  List<ProductsModel> get products => _products;

  Map<String, ProductsModel> _listcar = Map();
  Map<String, ProductsModel> get listcar => _listcar;

  @override
  void onInit(){
    super.onInit();
    print("produtos");

  }


  @override
  void onReady(){
    super.onReady();

}

 Future<void> loadProducts() async{
    final data = await ProductsApi.instance.getProducts();
    print(data);
    this._products = data!;
    this; _loading = false;
    update(['products']);

 }
 listCar(int index, bool car) {
    ProductsModel products = this._products[index];
    products.listCar = listCar(index, car);
    if(listCar(index, car)){
      this._listcar[products.title] = products;

    }else{
      this._listcar.remove(products.title);
    }
    update(['products', 'listacat']);
 }

   void increment(index){
       update();
   }
  void decrement(index){
    update();
  }
}
