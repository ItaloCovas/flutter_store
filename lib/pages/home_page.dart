import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/constant/categorias.dart';
import 'package:flutter_store/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryBlack,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryBlack,
        leading: InkWell(
          splashColor: Colors.white,
          onTap: () => Scaffold.of(context).openDrawer(),
          child: ContainerPlus(
            margin: EdgeInsets.only(left: 15),
            width: 25,
            height: 15,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0),
              child: Stack(
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.grey,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ContainerPlus(
          child: Column(
            children: [
              TextPlus('Olá! Seja Bem-Vindo à Loja Padawns. 👋',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'RobotoMono',
                  padding: EdgeInsets.fromLTRB(27, 35, 27, 5)),
              SizedBox(
                height: 35,
              ),
              TextFieldPlus(
                padding: EdgeInsets.only(left: 10),
                height: 65,
                cursorColor: Colors.white.withOpacity(0.5),
                width: size.width - 35,
                backgroundColor: Colors.grey.shade900,
                letterSpacing: 2,
                textInputType: TextInputType.text,
                fontFamily: 'RobotoMono',
                radius: RadiusPlus.all(15),
                textColor: Colors.grey,
                placeholder: TextPlus(
                  'Procurar Produtos',
                  color: Colors.grey.shade700,
                  fontSize: 15,
                ),
                prefixWidget: Icon(
                  Icons.search_rounded,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Row(
                    children: List.generate(categorias.length, (index) {
                      return NomeCategoria(
                        nome: categorias[index],
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(),
    );
  }
}

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ContainerPlus(
      color: primaryBlack,
      child: BottomAppBar(
        elevation: 0,
        color: primaryBlack,
        child: SizedBox(
          height: 65.0,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.local_grocery_store,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NomeCategoria extends StatelessWidget {
  final String nome;
  const NomeCategoria({
    Key? key,
    required this.nome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: ContainerPlus(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: TextPlus(
            nome,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w600,
            fontSize: 15,
            fontFamily: 'RobotoMono',
          ),
        ),
      ),
    );
  }
}

class IconButtomBar extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  const IconButtomBar(
      {required this.icon,
      required this.selected,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 30,
            color: selected ? Colors.white : Color(0xff646466),
          ),
        ),
      ],
    );
  }
}
