import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/provider/also_like_provider.dart';
import 'package:furniture_shop_app/data/provider/auth_provider.dart';
import 'package:furniture_shop_app/data/provider/cart_provider.dart';
import 'package:furniture_shop_app/data/provider/discover_provider.dart';
import 'package:furniture_shop_app/data/provider/new_collection_provider.dart';
import 'package:furniture_shop_app/data/provider/selling_provider.dart';
import 'package:furniture_shop_app/data/provider/trending_provider.dart';

import 'package:furniture_shop_app/screens/on_boarding/onboarding_screen.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TrendingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DiscoverProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewCollectionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SellingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AlsoLikeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: const Color(0xfff9c678),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
                color: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                )),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(0xffff2d55))),
        debugShowCheckedModeBanner: false,
        home: const OnBoardingScreen(),
      ),
    );
  }
}
