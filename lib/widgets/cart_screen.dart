import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
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
  final carts = GetIt.I.get<HomeApiStore>();
  @override
  void initState() {
    super.initState();
    carts.getProductsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlack,
      appBar: _AppBar(),
      body: Stack(
        children: [
          _buildBottom(),
          Observer(builder: (_) {
            if (carts.productsModel!.isEmpty) {
              return Center(
                child: TextPlus(
                  'Não há produtos no Carrinho!',
                  color: Colors.white,
                  fontFamily: 'RobotoMono',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              );
            }
            if (carts.productsModel != null) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: carts.productsModel?.length,
                  itemBuilder: (ctx, index) {
                    var products = carts.productsModel![index];
                    return Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 35, top: 30),
                                child: ContainerPlus(
                                  width: 86,
                                  height: 86,
                                  color: secondaryBlack,
                                  radius: RadiusPlus.all(15),
                                  child: Column(children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 8, 10, 10),
                                      child: ClipOval(
                                        child: Image(
                                          image: NetworkImage(products.image),
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
                                      products.title,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text.rich(TextSpan(
                                        text: products.price.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[700],
                                        ),
                                        children: [
                                          TextSpan(
                                            text: ' x2 u',
                                            style: TextStyle(
                                                color: Colors.grey[700]),
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
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ],
      ),
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

  Padding _buildBottom() {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: Column(
        children: [
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
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
    );
  }
}
