import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/provider/auth_provider.dart';

import 'package:furniture_shop_app/screens/add_collection/collection_view.dart';

import 'package:furniture_shop_app/screens/auth/welcome_screen.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/screens/cart/cart_screen.dart';
import 'package:furniture_shop_app/screens/filters/filter_screen.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Consumer<AuthProvider>(
                  builder: (context, value, child) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: const Color(0xffEDE4EB),
                        backgroundImage: NetworkImage(value.data!.image!),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<AuthProvider>(
                        builder: (context, value, child) {
                          return Text(
                            value.data!.name!,
                            style: Theme.of(context).textTheme.headline6,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      Consumer<AuthProvider>(
                        builder: (context, value, child) {
                          return Text(
                            value.data!.email!,
                            style: const TextStyle(color: Colors.grey),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Expanded(
              child: Column(
            children: [
              defaultdrawerWidgets(
                  icon: Icons.home,
                  title: "Home",
                  press: () {
                    Navigator.pop(context);
                  }),
              defaultdrawerWidgets(
                  icon: Icons.queue_rounded,
                  title: "Collections ",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (conttext) => const CollectionView()));
                  }),
              defaultdrawerWidgets(
                  icon: Icons.filter_alt_rounded,
                  title: "Filters",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FilteersScreen()));
                  }),
              defaultdrawerWidgets(
                  icon: Icons.shopping_cart,
                  title: "Your cart",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()));
                  }),
              defaultdrawerWidgets(
                  icon: Icons.notifications,
                  title: "Notifications",
                  press: () {}),
              defaultdrawerWidgets(
                  icon: Icons.settings, title: "Settings", press: () {}),
              defaultdrawerWidgets(
                  icon: Icons.power_settings_new,
                  title: "Logout",
                  press: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()),
                        (Route<dynamic> route) => false);
                  })
            ],
          ))
        ],
      ),
    );
  }

  Widget defaultdrawerWidgets({icon, title, press}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: icnColor,
          ),
          TextButton(
              onPressed: press,
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.black87),
              ))
        ],
      ),
    );
  }
}
