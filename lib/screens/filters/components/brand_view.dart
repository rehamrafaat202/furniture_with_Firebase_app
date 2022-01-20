import 'package:flutter/material.dart';

class Brand extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  const Brand(
      {required this.title,
      required this.subtitle1,
      required this.subtitle2,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 17, color: Colors.black),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              allBrands(title: subtitle1),
              allBrands(title: subtitle2),
              const Spacer(),
              const Icon(Icons.arrow_right),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Divider()
        ],
      ),
    );
  }

  Container allBrands({title}) {
    return Container(
      margin: const EdgeInsets.only(right: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      color: Colors.black,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
