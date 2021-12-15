import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/theme/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerPlus(
        color: primaryBlack,
        child: Column(
          children: [
            ContainerPlus(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 40, right: 5, left: 15),
              height: 300,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: TextPlus('Carrinho Padawans',
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'RobotoMono',
                        padding: EdgeInsets.fromLTRB(5, 35, 17, 5)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
