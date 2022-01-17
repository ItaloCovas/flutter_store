import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/cart_store.dart';
import 'package:flutter_store/controllers/home_store.dart';
import 'package:flutter_store/controllers/login_store.dart';
import 'package:flutter_store/controllers/users_store.dart';
import 'package:flutter_store/pages/login_page.dart';
import 'package:get_it/get_it.dart';

void main() async {
  //Iniciando o GetIt
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<LoginStore>(LoginStore());
  getIt.registerSingleton<UsersApiStore>(UsersApiStore());
  getIt.registerSingleton<CartStore>(CartStore());
  getIt.registerSingleton<HomeApiStore>(HomeApiStore());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterAppPlus(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'RobotoMono',
      ),
      home: LoginPage(),
    );
  }
}
