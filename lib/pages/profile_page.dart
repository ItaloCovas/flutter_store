import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/login_store.dart';
import 'package:flutter_store/theme/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlack,
      body: Padding(
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
            TextPlus('John Doe', color: Colors.white, fontSize: 16),
            SizedBox(height: 5),
            TextPlus('john@gmail.com', color: Colors.white),
          ],
        ),
      ),
      bottomNavigationBar: ContainerPlus(
        height: 300,
        border: BorderPlus(
          color: Colors.white,
          width: 0.5,
          style: BorderStyle.solid,
        ),
        radius: RadiusPlus.all(15),
        color: primaryBlack,
        shadows: [
          ShadowPlus(
            color: Colors.black12.withOpacity(0.15),
            moveRight: -10,
            blur: 10,
          ),
        ],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
            child: Column(
              children: [
                Center(
                  child: TextPlus('Informações do Usuário',
                      fontSize: 20,
                      fontFamily: 'RobotoMonoS',
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    TextPlus(
                      'Endereço: ',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextPlus(
                        'New Road, 7682 - Kilcoole. 12926-3874',
                        fontSize: 15,
                        color: Colors.white54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    TextPlus(
                      'Telefone: ',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.phone, color: Colors.white, size: 18),
                    SizedBox(width: 5),
                    TextPlus(
                      '1-570-236-7033',
                      color: Colors.white54,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    TextPlus(
                      'E-mail: ',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.email, color: Colors.white, size: 18),
                    SizedBox(width: 5),
                    TextPlus(
                      'john@gmail.com',
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TextPlus(
                      '* Todas as compras efetuadas serão enviadas por e-mail com seus respectivos detalhes!',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
