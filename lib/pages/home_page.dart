import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/theme/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primaryBlack,
      ),
    );
  }
}

