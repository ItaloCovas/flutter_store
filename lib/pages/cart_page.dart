import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/cart_store.dart';
import 'package:flutter_store/controllers/home_store.dart';
import 'package:flutter_store/widgets/home_page.dart';
import 'package:flutter_store/theme/colors.dart';
import 'package:flutter_store/widgets/cart_screen.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartPage = HomeApiStore();

  @override
  void initState() {
    super.initState();
    cartPage.getProductsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlack,
      body: const CartScreen(),
      bottomNavigationBar: ContainerPlus(
        height: 260,
        color: primaryBlack,
        radius: RadiusPlus.only(topLeft: 30, topRight: 30),
        shadows: [
          ShadowPlus(
            color: Colors.black12.withOpacity(0.30),
            blur: 12,
            moveRight: 10,
          ),
          ShadowPlus(
            color: Colors.black12.withOpacity(0.30),
            blur: 12,
            moveRight: -10,
          ),
        ],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
            child: Column(
              children: [
                Row(
                  children: [
                    ContainerPlus(
                      child: TextPlus('Informações',
                          fontSize: 20,
                          fontFamily: 'RobotoMonoS',
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextPlus(
                      'Subtotal',
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    TextPlus(
                      '\$1000.00',
                      fontSize: 15,
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextPlus(
                      'Desconto',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    TextPlus(
                      '- 5%',
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextPlus(
                      'Total',
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    TextPlus(
                      '\$950.00',
                      color: Colors.red[700],
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonPlus(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  radius: RadiusPlus.all(12),
                  color: buttonColor,
                  enabled: true,
                  child: TextPlus(
                    'FINALIZAR (\$950.00)',
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print('FINALIZAR');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
