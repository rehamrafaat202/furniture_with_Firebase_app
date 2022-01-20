import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/provider/auth_provider.dart';

import 'package:furniture_shop_app/screens/home/home_screen.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/widgets/container_button.dart';
import 'package:provider/provider.dart';

class ConfirmedScreen extends StatelessWidget {
  const ConfirmedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(children: [
            Image.asset(
              "assets/images/checkMark.png",
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Thank You!",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(
                child: Text(
              "your order #8754 is completed.\n Please check the delivery status at\n order tracking page",
              style: TextStyle(color: Colors.black38, fontSize: 18),
              textAlign: TextAlign.center,
            )),
            Consumer<AuthProvider>(
              builder: (context, value, child) {
                return ContainerButton(
                    color: blackColor,
                    txtColor: Colors.white,
                    title: "Continue Shopping",
                    submit: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    });
              },
            ),
            const SizedBox(
              height: 100,
            ),
          ]),
        ),
      ),
    );
  }
}
