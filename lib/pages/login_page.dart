import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/login_store.dart';
import 'package:flutter_store/pages/home_page.dart';
import 'package:flutter_store/api/users_api.dart';
import 'package:flutter_store/theme/colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  LoginStore loginStore = LoginStore();

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
                                      TextPlus("Nome de usuário",
                                          color: Colors.white),
                                      SizedBox(
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
                                            prefixWidget: Icon(
                                                Icons.alternate_email,
                                                size: 18,
                                                color: Colors.black),
                                          );
                                        },
                                      ),
                                      SizedBox(height: 15),
                                      TextPlus("Senha", color: Colors.white),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Observer(
                                        builder: (_) {
                                          return Container(
                                            height: 30,
                                            child: TextFormField(
                                              obscureText:
                                                  !loginStore.passwordVisible,
                                              onChanged: loginStore.setPassword,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                              decoration: InputDecoration(
                                                prefixIconConstraints:
                                                    BoxConstraints(
                                                  maxHeight: 20,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.only(top: 0),
                                                filled: true,
                                                enabled: !loginStore.loading,
                                                hintText: "••••••••",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                                prefixIcon: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
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
                                                      ? Icon(Icons.visibility)
                                                      : Icon(
                                                          Icons.visibility_off),
                                                  iconSize: 18,
                                                  color: Colors.black,
                                                  onPressed: loginStore
                                                      .togglePasswordVisibility,
                                                ),
                                                fillColor: Colors.white,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextPlus("Esqueceu sua senha?",
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                      SizedBox(height: 25),
                                      Observer(
                                        builder: (_) {
                                          return Center(
<<<<<<< HEAD
                                            child: ButtonPlus(
                                              onPressed: loginStore.isFormValid
                                                  ? () async {
                                                      await loginStore.login();
                                                      navigatorPlus
                                                          .show(HomePage());
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
                                                  ? CircularProgressIndicator(
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
=======
                                        child: ButtonPlus(
                                          onPressed: loginStore.isFormValid ? () async {
                                            await loginStore.login();
                                          } : null,
                                          height: 60,
                                          width: 300,
                                          radius: RadiusPlus.all(16),
                                          color: loginStore.isFormValid ? buttonColor : buttonColor.withOpacity(0.4),
                                          enabled: loginStore.isFormValid ? true : false,
                                          child: loginStore.loading ? CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation(Colors.white),
                                          ) : TextPlus(
                                            "Login",
                                            color: loginStore.isFormValid ? Colors.white : Colors.white54,
                                            fontSize: 16,
                                            fontWeight:FontWeight.bold,
                                          ),
                                        ),
                                      );
>>>>>>> 18790e8c2e26e34302d653bb09ebf3e4209bdee3
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
                                        SizedBox(
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
                                            onChanged:
                                                loginStore.setRegisterPassword,
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
                                            onChanged:
                                                loginStore.setRegisterPassword,
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
                                        SizedBox(height: 15),
                                        Center(
                                          child: ButtonPlus(
<<<<<<< HEAD
                                            onPressed:
                                                loginStore.isRegisterFormValid
                                                    ? () {
                                                        navigatorPlus
                                                            .show(LoginPage());
                                                      }
                                                    : null,
                                            height: 60,
=======
                                            onPressed: loginStore.isRegisterFormValid ? () async {
                                              await loginStore.register();
                                            } : null,
                                            height: 40,
>>>>>>> 18790e8c2e26e34302d653bb09ebf3e4209bdee3
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
