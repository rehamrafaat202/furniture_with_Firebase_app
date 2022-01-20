import 'package:flutter/material.dart';
import 'package:furniture_shop_app/screens/check_out/check_out_screen.dart';

class CheckOutButton extends StatelessWidget {
  final Function press;
  const CheckOutButton({required this.press, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        total(title: "Shipping fee", price: 6.0),
        total(title: "Sub tsotal", price: 6.0),
        total(title: "Total", price: 6.0, col: Colors.black),
        const SizedBox(
          height: 15.0,
        ),
        InkWell(
          onTap: () {
            press();
          },
          child: Container(
            width: double.infinity,
            height: 120,
            color: Colors.black,
            child: Center(
              child: Text(
                "CheckOut".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget total({title, price, col = Colors.grey}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: col, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            "\$$price",
            style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}
