import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/controllers/login_store.dart';
import 'package:flutter_store/controllers/users_store.dart';
import 'package:flutter_store/theme/colors.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final loginStore = GetIt.I.get<LoginStore>();
  final usersApiStore = GetIt.I.get<UsersApiStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersApiStore.getUsersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlack,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Observer(builder: (_) {
            if (usersApiStore.usersModel != null) {
              return Column(
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
                  TextPlus(
                    "${usersApiStore.usersModel!.name.firstname.toString().capitalizeFirstWord} ${usersApiStore.usersModel!.name.lastname.toString().capitalizeFirstWord}",
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  SizedBox(height: 5),
                  TextPlus(usersApiStore.usersModel!.email,
                      color: Colors.white),
                  SizedBox(height: 30),
                  ContainerPlus(
                    height: 330,
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
                                    '${usersApiStore.usersModel!.address.street}, ${usersApiStore.usersModel!.address.number} - ${usersApiStore.usersModel!.address.city}. ${usersApiStore.usersModel!.address.zipcode}',
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
                                Icon(Icons.phone,
                                    color: Colors.white, size: 18),
                                SizedBox(width: 5),
                                TextPlus(
                                  usersApiStore.usersModel!.phone,
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
                                Icon(Icons.email,
                                    color: Colors.white, size: 18),
                                SizedBox(width: 5),
                                TextPlus(
                                  usersApiStore.usersModel!.email,
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ),
    );
  }
}
