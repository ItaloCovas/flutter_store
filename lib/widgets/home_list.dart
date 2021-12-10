import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_store/model/products_model.dart';
import 'package:flutter_store/theme/colors.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();

}

class _HomeListState extends State<HomeList> {

  initState() {
    //dps do HomeListState
    //Regarregar os produtcs
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(
        id: 'products',
        builder: (_) {
          if (_.loading) {
            return Center(
              child: LinearProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              elevation: 0,
              backgroundColor: primaryBlack,
              leading: InkWell(
                splashColor: Colors.white,
                onTap: () => Scaffold.of(context).openDrawer(),
              ),
              actions: [
                GetBuilder<HomeController>(
                    id: 'listcar',
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                        child: GestureDetector(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                size: 38,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.grey.shade900,
                                  foregroundColor: Colors.white,
                                  child: TextPlus(
                                    "${_.listcar.length}",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
            body: SingleChildScrollView(
              child: ContainerPlus(
                color: Colors.grey.shade900,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 1.5,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                    ),
                    itemCount: _.products == null ? 0 : _.products.length,
                    itemBuilder: (context, index) {
                      final ProductsModel products = _.products[index];
                      return Card(
                        elevation: 4.0,
                        child: Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.center,
                          children: [
                            Expanded(child: CachedNetworkImage(
                                imageUrl: '${'https://fakestoreapi.com/products' +
                                    products.image.toString()}' + 'alt=media',
                                fit: BoxFit.cover,
                                placeholder: (_, __) {
                                  return Center(
                                    child: CupertinoActivityIndicator(
                                      radius: 15,
                                    ),
                                  );
                                }
                            ))
                          ],
                        ),
                      );
                    }
                ),
              ),
            ),
          );
        }
    );
  }
}
