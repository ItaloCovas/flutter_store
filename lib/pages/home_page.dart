import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/home_store.dart';
import 'package:flutter_store/pages/cart_page.dart';
import 'package:flutter_store/pages/home_list.dart';
import 'package:flutter_store/pages/profile_page.dart';
import 'package:flutter_store/theme/colors.dart';

final homeApiStore = HomeApiStore();
final screens = [
  HomeList(),
  CartPage(),
  ProfilePage(),
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return IndexedStack(
            index: homeApiStore.selectedIndex,
            children: screens,
          );
        }
      ),
      backgroundColor: primaryBlack,
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomNavigationBar(
        backgroundColor: primaryBlack,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade800,
        currentIndex: homeApiStore.selectedIndex,
        onTap: (index) => homeApiStore.selectedIndex = index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                      size: 30,
            ),
            label: "",
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store,
                      size: 30,
            ),
            label: "",
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person,
                      size: 30,
            ),
            label: "",
            ),
        ],
      );
        }
      ),
    );
  }
}
