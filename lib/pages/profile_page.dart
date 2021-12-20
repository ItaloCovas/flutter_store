import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextPlus('HELLO', color: Colors.white),
    );
  }
}