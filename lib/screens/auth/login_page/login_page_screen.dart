import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/provider/auth_provider.dart';

import 'package:furniture_shop_app/repositry/auth_repositry.dart';
import 'package:furniture_shop_app/screens/auth/register_page/signup_page_screen.dart';
import 'package:furniture_shop_app/screens/home/home_screen.dart';
import 'package:furniture_shop_app/style.dart';

import 'package:furniture_shop_app/widgets/container_button.dart';
import 'package:furniture_shop_app/widgets/default_text_form.dart';
import 'package:provider/provider.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isloading = false;

  void addLoading() {
    setState(() {
      isloading = false;
    });
  }

  // AuthRepositry repo = AuthRepositry();

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
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      const SizedBox(
                        height: 100,
                      ),
                      defaultFormText(
                        control: emailController,
                        type: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Email can't be Empty";
                          }
                          return null;
                        },
                        label: "Email",
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      defaultFormText(
                        control: passwordController,
                        type: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password is to short !";
                          }
                          return null;
                        },
                        label: "password",
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      ContainerButton(
                          color: const Color(0xff242A37),
                          txtColor: Colors.white,
                          title: "LOGIN",
                          submit: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isloading = true;
                              });
                              Provider.of<AuthProvider>(context, listen: false)
                                  .getuserLogin(
                                      context: context,
                                      addLoading: () => addLoading(),
                                      emailController: emailController,
                                      passwordController: passwordController)
                                  .then((value) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                    (Route<dynamic> route) => false);
                              }).catchError((e) {
                                return e;
                              });
                            }
                          }),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have account yet ?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupPageScreen()));
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff242A37)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
