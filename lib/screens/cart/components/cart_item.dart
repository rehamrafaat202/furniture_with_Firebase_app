import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/models/cart_model.dart';
import 'package:furniture_shop_app/style.dart';

class CartItem extends StatelessWidget {
  final CartModel cart;
  const CartItem({
    required this.cart,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Stack(children: [
        Container(
            margin: const EdgeInsets.only(right: 20, bottom: 20),
            height: 100,
            width: 85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: reviewGroundColor),
            child: Image.network(cart.img!)),
        Positioned(
          left: 10.0,
          child: Container(
            margin: const EdgeInsets.only(right: 8.0),
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.black),
            child: const Center(
              child: Text(
                "1",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ]),
      Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cart.title!,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(
            height: 8,
          ),
          Text("\$${cart.price}", style: TextStyle(color: Colors.grey[400])),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                  ),
                  Text("Black", style: TextStyle(color: Colors.grey[400])),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                width: 1,
                height: 15,
                color: Colors.black,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 2.0),
                    child: Text(
                      "Size : ",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                  Text(
                    "${cart.size}",
                  ),
                ],
              ),
            ],
          )
        ],
      ))
    ]);
  }
}
