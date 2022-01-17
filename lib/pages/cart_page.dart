import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/cart_store.dart';

import 'package:flutter_store/theme/colors.dart';
import 'package:flutter_store/widgets/cart_screen.dart';
import 'package:get_it/get_it.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartStore = GetIt.I.get<CartStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
          backgroundColor: primaryBlack,
          body: const CartScreen(),
          bottomNavigationBar: ContainerPlus(
              height: 250,
              color: primaryBlack,
              radius: RadiusPlus.only(topLeft: 30, topRight: 30),
              shadows: [
                ShadowPlus(
                  color: secondaryBlack.withOpacity(0.20),
                  blur: 10,
                  spread: 15,
                  moveRight: 17,
                ),
                ShadowPlus(
                  color: secondaryBlack.withOpacity(0.20),
                  blur: 10,
                  spread: -15,
                  moveRight: -17,
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
                            ' R\$ ${cartStore.total.toStringAsFixed(2)}',
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
                            '0%',
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
                            ' R\$ ${cartStore.total.toStringAsFixed(2)}',
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
                        height: 40,
                        radius: RadiusPlus.all(12),
                        color: buttonColor,
                        enabled: true,
                        child: TextPlus(
                          'FINALIZAR   R\$ ${cartStore.total.toStringAsFixed(2)}',
                          color: Colors.white,
                        ),
                        onPressed: () {
                          if (cartStore.products!.isEmpty) {
                            dialogPlus.showDefault(
                                title: 'ERRO',
                                message:
                                    "Não foi possível finalizar sua compra, antes adicione ao menos um item no carrinho!",
                                elementsSpacing: 15,
                                buttonOneText: 'OK',
                                buttonOneColor: buttonColor,
                                buttonOneCallback: () {
                                  navigatorPlus.back();
                                });
                          } else {
                            dialogPlus.showDefault(
                                title: 'SUCESSO 🚀💜',
                                message:
                                    "Pedido finalizado com sucesso! Todos os dados serão enviados por email.\n Que a força esteja com você!",
                                elementsSpacing: 15,
                                buttonOneText: 'OK',
                                buttonOneColor: buttonColor,
                                buttonOneCallback: () {
                                  navigatorPlus.back();
                                });
                            cartStore.clearCart();
                          }
                        },
                      )
                    ],
                  ),
                ),
              )));
    });
  }
}
