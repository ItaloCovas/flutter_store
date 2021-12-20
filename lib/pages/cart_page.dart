import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/cart_store.dart';
import 'package:flutter_store/controllers/home_store.dart';
import 'package:flutter_store/theme/colors.dart';


class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartPage = CartStore();
  final homeApiStore = HomeApiStore();

  @override
  void initState() {
    super.initState();
    cartPage.getCartsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerPlus(
        color: primaryBlack,
        child: Column(
          children: [
            ContainerPlus(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 50, right: 10, left: 15),
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
                    child: TextPlus('Carrinho Padawans 🛒',
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'RobotoMono',
                        padding: EdgeInsets.fromLTRB(0, 50, 10, 5)),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              height: 400,
              decoration: BoxDecoration(
                  color: secondaryBlack,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 18),
                        child: TextPlus(
                          'Subtotal',
                          fontSize: 18,
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade300,
                          letterSpacing: 1,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: ButtonPlus(
                          width: 350,
                          height: 50,
                          radius: RadiusPlus.all(12),
                          color: buttonColor,
                          enabled: true,
                          child: TextPlus(
                            'Finalizar Compra',
                            fontSize: 18,
                            fontFamily: 'RobotoMono',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}