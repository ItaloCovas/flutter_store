import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_store/theme/colors.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: ContainerPlus(
                    color: secondaryBlack,
                    radius: RadiusPlus.all(15),
                    child: Image(
                      image: NetworkImage(
                          'https://o.remove.bg/downloads/daac09b1-030f-40ab-81c7-2f8c6dd151ac/headset-gamer-razer-man-owar-wireless-preto-11482289-removebg-preview.png'),
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextPlus(
                    'HeadSet',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(TextSpan(
                      text: '\$500',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                      children: [
                        TextSpan(
                          text: ' x2 u',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ])),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
