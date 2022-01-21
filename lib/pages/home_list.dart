import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/cart_store.dart';
import 'package:flutter_store/widgets/electronics_category.dart';
import 'package:flutter_store/controllers/home_store.dart';
import 'package:flutter_store/theme/colors.dart';
import 'package:flutter_store/widgets/jewelery_category.dart';
import 'package:flutter_store/widgets/mensclothing_category.dart';
import 'package:flutter_store/widgets/womens_clothing.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  final homeApiStore = GetIt.I.get<HomeApiStore>();
  final cartStore = GetIt.I.get<CartStore>();

  @override
  void initState() {
    super.initState();
    homeApiStore.getProductsList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryBlack,
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(29, 85, 29, 5),
            child: TextPlus(
              'Olá! Seja bem-vindo à Loja Padawans.👋',
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontFamily: "RobotoMono",
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27, right: 27),
            child: TextFieldPlus(
              padding: const EdgeInsets.only(left: 15),
              height: 65,
              cursorColor: Colors.white.withOpacity(0.5),
              width: size.width - 35,
              backgroundColor: secondaryBlack,
              letterSpacing: 2,
              textInputType: TextInputType.text,
              fontWeight: FontWeight.w400,
              fontFamily: 'RobotoMono',
              radius: RadiusPlus.all(15),
              textColor: Colors.grey,
              placeholder: TextPlus(
                'Procurar Produtos',
                color: Colors.grey.shade700,
                fontSize: 15,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.w400,
              ),
              prefixWidget: Icon(
                Icons.search_rounded,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DefaultTabController(
            length: 5,
            child: Column(
              children: [
                ContainerPlus(
                  margin: const EdgeInsets.only(left: 18, right: 18),
                  child: Align(
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 15, right: 15),
                      labelColor: Colors.white,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.white,
                      unselectedLabelColor: Colors.grey[800],
                      tabs: const [
                        Tab(
                          text: "Todos",
                        ),
                        Tab(
                          text: "Eletrônicos",
                        ),
                        Tab(
                          text: "Acessrios",
                        ),
                        Tab(
                          text: "Roupas Masculinas",
                        ),
                        Tab(
                          text: "Roupas Femininas",
                        ),
                      ],
                    ),
                  ),
                ),
                ContainerPlus(
                  height: 500,
                  width: double.maxFinite,
                  child: TabBarView(children: [
                    SingleChildScrollView(
                      child: Observer(
                        builder: (_) {
                          if (homeApiStore.productsModel != null) {
                            return ContainerPlus(
                              color: primaryBlack,
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                ),
                                physics: const BouncingScrollPhysics(),
                                addAutomaticKeepAlives: false,
                                itemCount: homeApiStore.productsModel?.length,
                                itemBuilder: (ctx, index) {
                                  var products =
                                      homeApiStore.productsModel![index];
                                  return GestureDetector(
                                    onTap: () => {
                                      bottomSheetPlus.show(
                                        onClosed: (_) {
                                          cartStore.amount = 0;
                                        },
                                        child: ContainerPlus(
                                          color: primaryBlack,
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 40, 10, 20),
                                                child: Column(
                                                  children: <Widget>[
                                                    ClipOval(
                                                      child: Image(
                                                        image: NetworkImage(
                                                            products.image),
                                                        width: 140,
                                                        height: 140,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20),
                                                    TextPlus(products.title,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        textAlign:
                                                            TextAlign.center),
                                                    const SizedBox(height: 5),
                                                    TextPlus(
                                                        products.description,
                                                        color: Colors.white,
                                                        textAlign:
                                                            TextAlign.center),
                                                    SizedBox(
                                                        height: products
                                                                    .description
                                                                    .length >
                                                                300
                                                            ? 55
                                                            : 70),
                                                    Observer(builder: (_) {
                                                      return Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          ButtonPlus(
                                                              child: TextPlus(
                                                                  '-',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.20,
                                                              color:
                                                                  primaryBlack,
                                                              border: BorderPlus(
                                                                  color:
                                                                      buttonColor,
                                                                  width: 1),
                                                              radius: RadiusPlus
                                                                  .all(8),
                                                              onPressed: cartStore
                                                                  .decrement),
                                                          const SizedBox(
                                                              width: 5),
                                                          ButtonPlus(
                                                              child: TextPlus(
                                                                  '${cartStore.amount}',
                                                                  color: Colors
                                                                      .white),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.40,
                                                              color:
                                                                  primaryBlack,
                                                              border: BorderPlus(
                                                                  color:
                                                                      buttonColor,
                                                                  width: 1),
                                                              radius: RadiusPlus
                                                                  .all(8)),
                                                          const SizedBox(
                                                              width: 5),
                                                          ButtonPlus(
                                                              child: TextPlus(
                                                                  '+',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.20,
                                                              color:
                                                                  primaryBlack,
                                                              border: BorderPlus(
                                                                  color:
                                                                      buttonColor,
                                                                  width: 1),
                                                              radius: RadiusPlus
                                                                  .all(8),
                                                              onPressed: cartStore
                                                                  .increment),
                                                        ],
                                                      );
                                                    }),
                                                    SizedBox(
                                                        height: products
                                                                    .description
                                                                    .length >
                                                                300
                                                            ? 40
                                                            : 100),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: <Widget>[
                                                        ButtonPlus(
                                                          child: TextPlus(
                                                              'Voltar',
                                                              color:
                                                                  Colors.white),
                                                          color: Colors.red,
                                                          radius:
                                                              RadiusPlus.all(8),
                                                          onPressed: () {
                                                            navigatorPlus
                                                                .back();
                                                          },
                                                        ),
                                                        ButtonPlus(
                                                          child: TextPlus(
                                                              'Adicionar ao carrinho',
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          color: buttonColor,
                                                          radius:
                                                              RadiusPlus.all(8),
                                                          width: 200,
                                                          onPressed: () {
                                                            if (cartStore
                                                                    .amount !=
                                                                0) {
                                                              cartStore.addProducts(
                                                                  homeApiStore
                                                                          .productsModel![
                                                                      index]);
                                                              dialogPlus
                                                                  .showDefault(
                                                                      title:
                                                                          'SUCESSO',
                                                                      message:
                                                                          "Produto adicionado com sucesso!",
                                                                      elementsSpacing:
                                                                          16,
                                                                      buttonOneText:
                                                                          'OK',
                                                                      buttonOneColor:
                                                                          buttonColor,
                                                                      buttonOneCallback:
                                                                          () {
                                                                        navigatorPlus
                                                                            .back();
                                                                      });
                                                            } else {
                                                              dialogPlus
                                                                  .showDefault(
                                                                      title:
                                                                          'ERRO',
                                                                      message:
                                                                          "Insira uma quantidade válida!",
                                                                      elementsSpacing:
                                                                          16,
                                                                      buttonOneText:
                                                                          'OK',
                                                                      buttonOneColor:
                                                                          buttonColor,
                                                                      buttonOneCallback:
                                                                          () {
                                                                        navigatorPlus
                                                                            .back();
                                                                      });
                                                            }
                                                            cartStore
                                                                .getTotal();
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        radius: RadiusPlus.top(20),
                                        heightPercentScreen: 1,
                                      ),
                                    },
                                    child: ContainerPlus(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5, bottom: 5),
                                      width: 190,
                                      height: 280,
                                      radius: RadiusPlus.all(15),
                                      color: secondaryBlack,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          ClipOval(
                                            child: Image(
                                              image:
                                                  NetworkImage(products.image),
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          TextPlus(products.title,
                                              fontSize: 10,
                                              color: Colors.white,
                                              textAlign: TextAlign.center),
                                          const SizedBox(height: 5),
                                          TextPlus(
                                              "R\$ " +
                                                  products.price.toString(),
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              textAlign: TextAlign.center),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: const <Widget>[
                                  Center(
                                    child: CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text('Aguarde... Carregando produtos',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SingleChildScrollView(child: ElectronicsCategory()),
                    SingleChildScrollView(child: JeweleryCategory()),
                    SingleChildScrollView(child: MensClothingCategory()),
                    SingleChildScrollView(child: WomensClothingCategory())
                  ]),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
