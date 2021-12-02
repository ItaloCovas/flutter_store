import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/theme/colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryBlack,
      body: ContainerPlus(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).padding.top),
            Image(
              image: AssetImage('assets/images/logo.png'),
              width: 280,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: DefaultTabController(
                length: 2,
                child: ContainerPlus(
                  height: 350,
                  color: Colors.red,
                  radius: RadiusPlus.all(12),
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        indicatorColor: Colors.white,
                        indicatorWeight: 2,
                        tabs: const [
                        Tab(text: "Login"),
                        Tab(text: "Registrar-se"),
                      ]),
                      SizedBox(height: 10),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  TextPlus("Endereço de e-mail", color: Colors.white),
                                  SizedBox(height: 5,),
                                  TextFieldPlus(
                                    height: 30,
                                    backgroundColor: secondaryBlack,
                                    controller: nameController,
                                    placeholder: TextPlus("padawans@frwk.com.br", color: Colors.white, fontSize: 14,),
                                    prefixWidget: Icon(Icons.alternate_email, size: 18, color: Colors.white),
                                  ),
                                  SizedBox(height: 15),
                                  TextPlus("Senha"),
                                  SizedBox(height: 5,),
                                  TextFieldPlus(
                                    height: 30,
                                    backgroundColor: secondaryBlack,
                                    controller: passController,
                                    placeholder: TextPlus("••••••••", color: Colors.white, fontSize: 14,),
                                    prefixWidget: Icon(Icons.lock, size: 18, color: Colors.white), 
                                    suffixWidget: Icon(Icons.remove_red_eye_outlined, size: 18, color: Colors.white),
                                  ),
                                  SizedBox(height: 15,),
                                  TextPlus("Esqueceu sua senha?"),
                                  SizedBox(height: 25),
                                  Center(
                                    child: ButtonPlus(
                                      height: 60,
                                      width: 300,
                                      radius: RadiusPlus.all(16),
                                      color: buttonColor,
                                      enabled: true,
                                      child: TextPlus("Login", color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text("Aeee"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
