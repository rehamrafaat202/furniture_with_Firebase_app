import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/provider/cart_provider.dart';

import 'package:furniture_shop_app/repositry/cart_repository.dart';
import 'package:furniture_shop_app/screens/check_out/check_out_screen.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/screens/cart/components/all_cart.dart';
import 'package:furniture_shop_app/widgets/checkout_button.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            Provider.of<CartProvider>(context, listen: false).displayInCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Text('${snapshot.data}');
            } else {
              return Consumer<CartProvider>(builder: (context, data, child) {
                return data.cart.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "Your Cart Is Empty",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28),
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          Image.asset(
                            "assets/images/purchase.png",
                            fit: BoxFit.cover,
                          ),
                        ],
                      )
                    : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Shopping Cart",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 28),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.only(bottom: 20.0),
                              decoration: const BoxDecoration(
                                  border: Border.symmetric(
                                      horizontal: BorderSide(
                                          color: containerBorder, width: 2))),
                              child: AllCarts(cart: data.cart),
                            ),
                            CheckOutButton(
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CheckOutScreen()));
                              },
                            )
                          ],
                        ),
                      );
              });
            }
          }
        });
  }
}
