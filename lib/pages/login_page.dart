import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/theme/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primaryBlack,
      body: ContainerPlus(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/logo.png'),
              width: 280,
              height: 280,
            ),
            
          ],
        ),
      ),
    );
  }
}