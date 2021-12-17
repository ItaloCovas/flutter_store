import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/pages/cart_page.dart';
import 'package:flutter_store/pages/home_list.dart';
import 'package:flutter_store/theme/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeList(),
      backgroundColor: primaryBlack,
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
                    color: Colors.grey.shade800,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey.shade800,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                  icon: Icon(
                    Icons.local_grocery_store,
                    color: Colors.grey.shade800,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: Colors.grey.shade800,
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
