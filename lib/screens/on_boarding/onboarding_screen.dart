import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/models/page_view_model.dart';

import 'package:furniture_shop_app/screens/on_boarding/old_body_version.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    var boardingController = PageController();
    return Scaffold(
      backgroundColor: const Color(0xfff1f2f6),
      body: SafeArea(
        child: PageView.builder(
          controller: boardingController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (index) {
            if (index == items.length - 1) {
              setState(() {
                isLast = true;
              });
            } else {
              setState(() {
                isLast = false;
              });
            }
          },
          itemBuilder: (context, index) => OldBodyVersion(
              model: items[index],
              boardingController: boardingController,
              isLast: isLast,
              index: index),
          itemCount: items.length,
        ),
      ),
    );
  }
}
