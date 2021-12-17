import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/home_store.dart';
import 'package:flutter_store/pages/cart_page.dart';
import 'package:flutter_store/pages/home_list.dart';
import 'package:flutter_store/theme/colors.dart';

HomeApiStore homeApiStore = HomeApiStore();


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

  List bottomItems = [
    homeApiStore.selectedIndex == 0 ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  ),
                ) : IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey.shade800,
                    size: 30,
                  ),
                ),
                homeApiStore.selectedIndex == 1 ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.local_grocery_store,
                    color: Colors.white,
                    size: 30,
                  ),
                ) : IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.local_grocery_store,
                    color: Colors.grey.shade800,
                    size: 30,
                  ),
                ),
                homeApiStore.selectedIndex == 2 ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                ) : IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: Colors.grey.shade800,
                    size: 30,
                  ),
                ),
  ];

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
              children: List.generate(bottomItems.length, (index) {
                return InkWell(
                  onTap: () {
                    homeApiStore.selectTab(index);
                  },
                  child: IconButton(
                    icon: bottomItems[index],
                    onPressed: bottomItems[index],
                  )
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
