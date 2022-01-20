import 'package:flutter/material.dart';
import 'package:furniture_shop_app/style.dart';

class BlackFriday extends StatelessWidget {
  const BlackFriday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        color: banner,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Image.network(
              "https://freepngimg.com/thumb/armchair/3-armchair-png-image-thumb.png"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50.0,
              ),
              child: Column(
                children: [
                  const Text(
                    "Black Friday",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                    child: Text("Sale Up to 70% off".toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text("Shop now".toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          const Icon(Icons.arrow_right)
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 30),
                        height: 1,
                        width: double.infinity,
                        color: Colors.black38,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
