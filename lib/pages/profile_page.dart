import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/theme/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
        child: Column(
          children: [
            Center(
              child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: buttonColor,
                              width: 2,
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile.png'),
                              fit: BoxFit.cover,
                            ))),
            ),
            SizedBox(height: 10),
            TextPlus('Nome Aqui', color: Colors.white, fontSize: 16),
          ],
        ),
      ),
    );
  }
}