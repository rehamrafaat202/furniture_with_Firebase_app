import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/models/page_view_model.dart';

import 'package:furniture_shop_app/screens/auth/welcome_screen.dart';
import 'package:furniture_shop_app/widgets/container_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OldBodyVersion extends StatelessWidget {
  final PagesViewModel model;
  final PageController boardingController;
  bool isLast;
  final int index;
  OldBodyVersion(
      {required this.model,
      required this.isLast,
      required this.boardingController,
      required this.index,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void submit() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    }

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            model.image,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: index == 2
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              if (index == 1) Spacer(),
              if (index == 2)
                SmoothPageIndicator(
                    effect: const ExpandingDotsEffect(
                        dotHeight: 10,
                        activeDotColor: Colors.black,
                        dotColor: Colors.white,
                        // activeDotColor: defaultColor,
                        expansionFactor: 1.1,
                        dotWidth: 10,
                        spacing: 5.0),
                    controller: boardingController,
                    count: items.length),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                model.title,
                style: TextStyle(
                    fontSize: index == 2 ? 26 : 20.0,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: index == 0 ? Colors.black : Colors.white),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  model.body,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: index == 0 ? Colors.black : Colors.white),
                  textAlign: index == 2 ? TextAlign.start : TextAlign.center,
                ),
              ),
              if (index == 0 || index == 2) const Spacer(),
              if (index == 0 || index == 1)
                SmoothPageIndicator(
                    effect: const ExpandingDotsEffect(
                        dotHeight: 10,
                        activeDotColor: Colors.black,
                        dotColor: Colors.white,
                        // activeDotColor: defaultColor,
                        expansionFactor: 1.1,
                        dotWidth: 10,
                        spacing: 5.0),
                    controller: boardingController,
                    count: items.length),
              SizedBox(
                height: 20,
              ),

              ContainerButton(
                color: Color(0xff242A37),
                txtColor: Colors.white,
                title: index == 0
                    ? "Start Shopping"
                    : index == 1
                        ? "Next"
                        : "Get Started",
                submit: () {
                  if (isLast) {
                    submit();
                  } else {
                    boardingController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
              )

              // const SizedBox(
              //   height: 30.0,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
