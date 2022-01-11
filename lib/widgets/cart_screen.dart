import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/carts_store.dart';
import 'package:flutter_store/controllers/home_store.dart';
import 'package:flutter_store/theme/colors.dart';
import 'package:flutter_store/widgets/cart_item.dart';
import 'package:get_it/get_it.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlack,
      appBar: _AppBar(),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (ctx, index) {
            return Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35, top: 30),
                        child: ContainerPlus(
                          width: 86,
                          height: 86,
                          color: secondaryBlack,
                          radius: RadiusPlus.all(15),
                          child: Column(children: const <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 8, 10, 10),
                              child: ClipOval(
                                child: Image(
                                  image: AssetImage("assets/images/logo.png"),
                                  width: 65,
                                  height: 65,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextPlus(
                              'sss',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text.rich(TextSpan(
                                text: 'R\$1000',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700],
                                ),
                                children: [
                                  TextSpan(
                                    text: ' hhhh',
                                    style: TextStyle(color: Colors.grey[700]),
                                  )
                                ])),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  _AppBar() {
    return AppBar(
        toolbarHeight: 70,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: primaryBlack,
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              TextPlus(
                'Detalhes da Compra',
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
              TextPlus(
                '1 item',
                color: Colors.grey[500],
                fontSize: 14,
              ),
            ],
          ),
        ));
  }
}
