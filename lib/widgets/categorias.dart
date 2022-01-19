import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/cart_store.dart';
import 'package:flutter_store/controllers/categories_store.dart';
import 'package:flutter_store/controllers/home_store.dart';
import 'package:flutter_store/model/categories_model.dart';
import 'package:get_it/get_it.dart';

class Categorias extends StatefulWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  final homeApiStore = GetIt.I.get<HomeApiStore>();
  final cartStore = GetIt.I.get<CartStore>();
  final categoriesStore = CategoriesStore();

  List<String> categories = [
    "Todos",
    "Eletronicos",
    "Acessorios",
    "Roupas Masculinas",
    "Roupas Femininas"
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(left: 4),
        child: SizedBox(
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoriesStore.categoriesProducts?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        categoriesStore.selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 12.0, top: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextPlus(
                            '${categoriesStore.categoriesProducts![index]}',
                            color: categoriesStore.selectedIndex == index
                                ? Colors.white
                                : Colors.grey.shade800,
                            fontWeight: FontWeight.w500,
                          ),
                          ContainerPlus(
                            margin: const EdgeInsets.only(top: 4),
                            height: 2,
                            width: 22,
                            color: categoriesStore.selectedIndex == index
                                ? Colors.white
                                : Colors.transparent,
                          )
                        ],
                      ),
                    ),
                  );
                })),
      );
    });
  }

  Widget buildCategoria(int index) {
    return Observer(builder: (_) {
      return GestureDetector(
        onTap: () {
          setState(() {
            categoriesStore.selectedIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 12.0, top: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextPlus(
                categories[index],
                color: categoriesStore.selectedIndex == index
                    ? Colors.white
                    : Colors.grey.shade800,
                fontWeight: FontWeight.w500,
              ),
              ContainerPlus(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 22,
                color: categoriesStore.selectedIndex == index
                    ? Colors.white
                    : Colors.transparent,
              )
            ],
          ),
        ),
      );
    });
  }
}
