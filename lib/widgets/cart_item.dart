import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/cart_store.dart';
import 'package:flutter_store/controllers/home_store.dart';
import 'package:flutter_store/theme/colors.dart';
import 'package:flutter_store/widgets/cart_screen.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final cartProd = HomeApiStore();
  @override
  void initState() {
    super.initState();
    cartProd.getProductsList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 187.0),
              child: TextPlus(
                'Meu Carrinho',
                color: Colors.white.withOpacity(0.8),
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const CartScreen(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 120, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextPlus(
                    'Forma de Pagamento',
                    color: Colors.white.withOpacity(0.8),
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: ContainerPlus(
                      color: secondaryBlack,
                      width: 60,
                      height: 45,
                      radius: RadiusPlus.all(8),
                      child: const Image(
                        image: AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextPlus(
                          'VISA Classic',
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text.rich(TextSpan(
                            text: '****-0921',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ))),
                      ]),
                  Padding(
                      padding: const EdgeInsets.only(left: 135),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 18,
                          )))
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
