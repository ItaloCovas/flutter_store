import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/pages/home_page.dart';
import 'package:flutter_store/theme/colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlack,
      body: SingleChildScrollView(
        child: ContainerPlus(
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
                  child: SingleChildScrollView(
                    child: ContainerPlus(
                      height: 365,
                      color: secondaryBlack,
                      radius: RadiusPlus.all(12),
                      child: Column(
                        children: <Widget>[
                          TabBar(
                              indicatorColor: Colors.white,
                              indicatorWeight: 2,
                              tabs: const [
                                Tab(
                                  text: "Login",
                                ),
                                Tab(text: "Registrar-se"),
                              ]),
                          SizedBox(height: 10),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      TextPlus("Endereço de e-mail",
                                          color: Colors.white),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFieldPlus(
                                        height: 30,
                                        backgroundColor: Colors.white,
                                        radius: RadiusPlus.all(10),
                                        textInputType:
                                            TextInputType.emailAddress,
                                        controller: nameController,
                                        placeholder: TextPlus(
                                          "padawans@frwk.com.br",
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                        prefixWidget: Icon(
                                            Icons.alternate_email,
                                            size: 18,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 15),
                                      TextPlus("Senha", color: Colors.white),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 30,
                                        child: TextFormField(
                                          obscureText: true,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            prefixIconConstraints:
                                                BoxConstraints(
                                              maxHeight: 20,
                                            ),
                                            contentPadding:
                                                EdgeInsets.only(top: 0),
                                            filled: true,
                                            hintText: "••••••••",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14),
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5),
                                              child: Icon(
                                                Icons.lock,
                                                size: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                            suffixIcon: Icon(
                                                Icons.remove_red_eye_outlined,
                                                size: 18,
                                                color: Colors.black),
                                            fillColor: Colors.white,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                          ),
                                          controller: passController,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextPlus("Esqueceu sua senha?",
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                      SizedBox(height: 25),
                                      Center(
                                        child: ButtonPlus(
                                          onPressed: () {
                                            navigatorPlus.show(HomePage());
                                          },
                                          height: 60,
                                          width: 300,
                                          radius: RadiusPlus.all(16),
                                          color: buttonColor,
                                          enabled: true,
                                          child: TextPlus(
                                            "Login",
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 15,
                                        left: 15,
                                        right: 15,
                                        top: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        TextPlus("Endereço de e-mail",
                                            color: Colors.white),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFieldPlus(
                                          height: 25,
                                          fontSize: 14,
                                          backgroundColor: Colors.white,
                                          radius: RadiusPlus.all(10),
                                          textInputType:
                                              TextInputType.emailAddress,
                                          placeholder: TextPlus(
                                            "padawans@frwk.com.br",
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                          prefixWidget: Icon(
                                              Icons.alternate_email,
                                              size: 18,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 15),
                                        TextPlus("Nome de usuário",
                                            color: Colors.white),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFieldPlus(
                                          height: 25,
                                          fontSize: 14,
                                          backgroundColor: Colors.white,
                                          radius: RadiusPlus.all(10),
                                          textInputType:
                                              TextInputType.emailAddress,
                                          placeholder: TextPlus(
                                            "JohnDoe",
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                          prefixWidget: Icon(
                                              Icons.alternate_email,
                                              size: 18,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 15),
                                        TextPlus(
                                          "Senha",
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 28,
                                          child: TextFormField(
                                            obscureText: true,
                                            style:
                                                TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              prefixIconConstraints:
                                                  BoxConstraints(
                                                maxHeight: 20,
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              filled: true,
                                              hintText: "••••••••",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                              prefixIcon: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, right: 5),
                                                child: Icon(
                                                  Icons.lock,
                                                  size: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              suffixIcon: Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  size: 18,
                                                  color: Colors.black),
                                              fillColor: Colors.white,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                            ),
                                            controller: passController,
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        TextPlus("Repita sua senha",
                                            color: Colors.white),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 28,
                                          child: TextFormField(
                                            obscureText: true,
                                            style:
                                                TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              prefixIconConstraints:
                                                  BoxConstraints(
                                                maxHeight: 20,
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              filled: true,
                                              hintText: "••••••••",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                              prefixIcon: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, right: 5),
                                                child: Icon(
                                                  Icons.lock,
                                                  size: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              suffixIcon: Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  size: 18,
                                                  color: Colors.black),
                                              fillColor: Colors.white,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                            ),
                                            controller: passController,
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        Center(
                                          child: ButtonPlus(
                                            onPressed: () {
                                              navigatorPlus.show(LoginPage());
                                            },
                                            height: 40,
                                            width: 300,
                                            radius: RadiusPlus.all(16),
                                            color: buttonColor,
                                            enabled: true,
                                            child: TextPlus(
                                              "Registrar-se",
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
