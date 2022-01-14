import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/cart_store.dart';
import 'package:flutter_store/controllers/home_store.dart';
import 'package:flutter_store/theme/colors.dart';
import 'package:flutter_store/widgets/home_page.dart';
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
    return Observer(builder: (_) {
      return Scaffold(
          backgroundColor: primaryBlack,
          appBar: _AppBar(),
          body: cartStore.products!.isEmpty
              ? Center(
                  child: TextPlus(
                    'Carrinho Vazio',
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                      itemCount: cartStore.products!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (ctx, index) => Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: ContainerPlus(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 5, right: 5),
                              width: double.infinity,
                              height: 115,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 2),
                              radius: RadiusPlus.all(10),
                              child: Dismissible(
                                key: ValueKey(
                                    cartStore.products![index].products.id),
                                onDismissed: (direction) {
                                  cartStore.removeProducts(
                                      cartStore.products![index].products);
                                },
                                background: ContainerPlus(
                                  radius: RadiusPlus.all(5),
                                  color: Colors.redAccent[700],
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.all(5),
                                  child: const Icon(
                                    Icons.delete_forever,
                                    color: Colors.white,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipOval(
                                          child: Image(
                                            image: NetworkImage(cartStore
                                                .products![index]
                                                .products
                                                .image),
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextPlus(
                                              cartStore.products![index]
                                                  .products.title,
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Text.rich(TextSpan(
                                                text:
                                                    'R\$ ${cartStore.products![index].products.price.toStringAsFixed(2)}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey[700],
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '  ${cartStore.products![index].quantity.toString()}x',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[700]),
                                                  )
                                                ])),
                                          ],
                                        )),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 12),
                                      child: Divider(
                                        height: 1,
                                        thickness: 2,
                                        color: secondaryBlack,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ))));
    });
  }

  _AppBar() {
    return AppBar(
        toolbarHeight: 70,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: primaryBlack,
        title: Observer(builder: (_) {
          return Padding(
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
                  '${cartStore.products!.length} item(s)',
                  color: Colors.grey[500],
                  fontSize: 14,
                ),
              ],
            ),
          );
        }));
  }
}
