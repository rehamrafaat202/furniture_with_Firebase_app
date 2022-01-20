import 'package:flutter/material.dart';
import 'package:furniture_shop_app/screens/auth/login_page/login_page_screen.dart';
import 'package:furniture_shop_app/screens/auth/register_page/signup_page_screen.dart';
import 'package:furniture_shop_app/widgets/container_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/c1.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Image.asset("assets/images/logo.png"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "LOZA",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: const Color(
                        0xff242A37,
                      ),
                      letterSpacing: 6.0),
                ),
                const Spacer(),
                ContainerButton(
                  title: "Sign Up",
                  submit: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPageScreen()));
                  },
                  color: Colors.white,
                  txtColor: const Color(0xff242A37),
                ),
                const SizedBox(
                  height: 10,
                ),
                ContainerButton(
                    title: "Login",
                    submit: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPageScreen()));
                    },
                    color: const Color(0xff242A37),
                    txtColor: Colors.white),
              ],
            ),
          )
        ],
      ),
    );
  }
}
