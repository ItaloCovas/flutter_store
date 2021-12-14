import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/constant/categorias.dart';
import 'package:flutter_store/controllers/home_store.dart';
import 'package:get/get.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/model/products_model.dart';
import 'package:flutter_store/theme/colors.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:mobx/src/api/observable_collections.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  final homeApiStore = HomeApiStore();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    homeApiStore.getProductsList();
  }

  @override
  Widget build(BuildContext context) {
    HomeApiStore homeApiStore = HomeApiStore();
    homeApiStore.getProductsList();
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: ContainerPlus(
        color: primaryBlack,
        child: Column(
          children: [
            TextPlus('Olá! Seja Bem-Vindo à Loja Padawans. 👋',
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w400,
                fontFamily: 'RobotoMono',
                padding: EdgeInsets.fromLTRB(27, 35, 27, 5)),
            SizedBox(
              height: 35,
            ),
            TextFieldPlus(
              padding: EdgeInsets.only(left: 10),
              height: 65,
              cursorColor: Colors.white.withOpacity(0.5),
              width: size.width - 35,
              backgroundColor: Colors.grey.shade900,
              letterSpacing: 2,
              textInputType: TextInputType.text,
              fontFamily: 'RobotoMono',
              radius: RadiusPlus.all(15),
              textColor: Colors.grey,
              placeholder: TextPlus(
                'Procurar Produtos',
                color: Colors.grey.shade700,
                fontSize: 15,
              ),
              prefixWidget: Icon(
                Icons.search_rounded,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Categorias(),
            Observer(
              builder: (_) {
                if (homeApiStore.productsModel != null) {
                  return ContainerPlus(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      itemCount: homeApiStore.productsModel!.length,
                      itemBuilder: (_, index) {
                        var products = homeApiStore.productsModel![index];
                        return ListTile(
                          title: Text(products.title),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
