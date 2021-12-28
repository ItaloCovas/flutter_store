import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_plus/flutter_plus.dart';

class Categorias extends StatefulWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  List<String> categorias = [
    "Todos",
    "Eletrônicos",
    "Jóias",
    "Roupas masculinas",
    "Roupas femininas",
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categorias.length,
            itemBuilder: (context, index) => buildCategoria(index)),
      ),
    );
  }

  Widget buildCategoria(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 12.0, top: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextPlus(
              categorias[index],
              color:
                  selectedIndex == index ? Colors.white : Colors.grey.shade800,
              fontWeight: FontWeight.w600,
            ),
            ContainerPlus(
              margin: EdgeInsets.only(top: 4),
              height: 2,
              width: 22,
              color: selectedIndex == index ? Colors.white : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}