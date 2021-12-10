import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/constant/categorias.dart';
import 'package:flutter_store/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/model/products_model.dart';
import 'package:flutter_store/theme/colors.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {


  final homeController = HomeController();

  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: ContainerPlus(
        color: primaryBlack,

        child: Column(
          children: [
            TextPlus('Olá! Seja Bem-Vindo à Loja Padawns. 👋',
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
            Stack(
                children: [
                  ContainerPlus(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    color: primaryBlack,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height ,
                    child: GridView.builder(
                      padding: EdgeInsets.only(left: 7, right: 7),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 2
                        ),
                        itemBuilder: (context, index) {
                          final HomeController products = homeController;
                          return homeController.obx((state) => const Text(''),
                              onError: (error) => Center(
                                child: Text(error!),

                              )
                          );
                        },

                    ),
                  )
                ]
            )
          ],
        ),
      ),
    );
  }
}
