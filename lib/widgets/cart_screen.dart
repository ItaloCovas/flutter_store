import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/cart_store.dart';
import 'package:flutter_store/controllers/home_store.dart';
import 'package:flutter_store/main.dart';
import 'package:flutter_store/theme/colors.dart';
import 'package:get_it/get_it.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final homeApiStore = GetIt.I.get<HomeApiStore>();
  final cartStore = GetIt.I.get<CartStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryBlack,
        appBar: _AppBar(),
        body: Observer(builder: (_) {
          return cartStore.products!.isEmpty
              ? Center(
                  child: TextPlus('Carrinho Vazio'),
                )
              : ListView.builder(
                  itemCount: cartStore.products!.length,
                  itemBuilder: (ctx, index) {
                    return ContainerPlus();
                  });
        }));
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
