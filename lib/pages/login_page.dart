import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/login_store.dart';
import 'package:flutter_store/theme/colors.dart';
import 'package:flutter_store/widgets/home_page.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginStore loginStore = GetIt.I.get<LoginStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    if (await localStoragePlus.containsKey('user_login')) {
      jsonDecode(await localStoragePlus.read('user_login'));
      navigatorPlus.show(const HomePage());
    } else {
      print('não tem chave');
    }
  }

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
              const Image(
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
                          const TabBar(
                              indicatorColor: Colors.white,
                              indicatorWeight: 2,
                              tabs: [
                                Tab(
                                  text: "Login",
                                ),
                                Tab(text: "Registrar-se"),
                              ]),
                          const SizedBox(height: 10),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      TextPlus("Nome de usuário",
                                          color: Colors.white),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Observer(
                                        builder: (_) {
                                          return TextFieldPlus(
                                            height: 30,
                                            fontSize: 15,
                                            backgroundColor: Colors.white,
                                            enabled: !loginStore.loading,
                                            radius: RadiusPlus.all(10),
                                            onChanged: loginStore.setUser,
                                            textInputType:
                                                TextInputType.emailAddress,
                                            placeholder: TextPlus(
                                              "seu_usuario",
                                              color: Colors.grey,
                                              fontSize: 14,
                                            ),
                                            prefixWidget: const Icon(
                                                Icons.account_circle,
                                                size: 18,
                                                color: Colors.black),
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 15),
                                      TextPlus("Senha", color: Colors.white),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Observer(
                                        builder: (_) {
                                          return SizedBox(
                                            height: 30,
                                            child: TextFormField(
                                              obscureText:
                                                  !loginStore.passwordVisible,
                                              onChanged: loginStore.setPassword,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                              decoration: InputDecoration(
                                                prefixIconConstraints:
                                                    const BoxConstraints(
                                                  maxHeight: 20,
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        top: 0),
                                                filled: true,
                                                enabled: !loginStore.loading,
                                                hintText: "••••••••",
                                                hintStyle: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                                prefixIcon: const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 5, right: 5),
                                                  child: Icon(
                                                    Icons.lock,
                                                    size: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                suffixIcon: IconButton(
                                                  icon: loginStore
                                                          .passwordVisible
                                                      ? const Icon(
                                                          Icons.visibility)
                                                      : const Icon(
                                                          Icons.visibility_off),
                                                  iconSize: 18,
                                                  color: Colors.black,
                                                  onPressed: loginStore
                                                      .togglePasswordVisibility,
                                                ),
                                                fillColor: Colors.white,
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                disabledBorder:
                                                    const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextPlus("Esqueceu sua senha?",
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                      const SizedBox(height: 25),
                                      Observer(
                                        builder: (_) {
                                          return Center(
                                            child: ButtonPlus(
                                              onPressed: loginStore.isFormValid
                                                  ? () async {
                                                      await loginStore.login();
                                                    }
                                                  : null,
                                              height: 60,
                                              width: 300,
                                              radius: RadiusPlus.all(16),
                                              color: loginStore.isFormValid
                                                  ? buttonColor
                                                  : buttonColor
                                                      .withOpacity(0.4),
                                              enabled: loginStore.isFormValid
                                                  ? true
                                                  : false,
                                              child: loginStore.loading
                                                  ? const CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation(
                                                              Colors.white),
                                                    )
                                                  : TextPlus(
                                                      "Login",
                                                      color:
                                                          loginStore.isFormValid
                                                              ? Colors.white
                                                              : Colors.white54,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                            ),
                                          );
                                        },
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
                                        TextPlus("Nome de usuário",
                                            color: Colors.white),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextFieldPlus(
                                          height: 25,
                                          fontSize: 14,
                                          backgroundColor: Colors.white,
                                          radius: RadiusPlus.all(10),
                                          onChanged: loginStore.setUserName,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          placeholder: TextPlus(
                                            "JohnDoe",
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                          prefixWidget: const Icon(
                                              Icons.alternate_email,
                                              size: 18,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(height: 15),
                                        TextPlus(
                                          "Senha",
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          height: 28,
                                          child: TextFormField(
                                            obscureText: true,
                                            onChanged:
                                                loginStore.setRegisterPassword,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            decoration: const InputDecoration(
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
                                                padding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                child: Icon(
                                                  Icons.lock,
                                                  size: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
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
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        TextPlus("Repita sua senha",
                                            color: Colors.white),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          height: 28,
                                          child: TextFormField(
                                            obscureText: true,
                                            onChanged:
                                                loginStore.setRegisterPassword,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            decoration: const InputDecoration(
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
                                                padding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                child: Icon(
                                                  Icons.lock,
                                                  size: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
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
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        Center(
                                          child: ButtonPlus(
                                            onPressed: loginStore
                                                    .isRegisterFormValid
                                                ? () async {
                                                    await loginStore.register();
                                                  }
                                                : null,
                                            height: 40,
                                            width: 300,
                                            radius: RadiusPlus.all(16),
                                            color: loginStore
                                                    .isRegisterFormValid
                                                ? buttonColor
                                                : buttonColor.withOpacity(0.4),
                                            enabled:
                                                loginStore.isRegisterFormValid
                                                    ? true
                                                    : false,
                                            child: TextPlus(
                                              "Registrar-se",
                                              color:
                                                  loginStore.isRegisterFormValid
                                                      ? Colors.white
                                                      : Colors.white54,
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
