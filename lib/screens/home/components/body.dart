import 'package:flutter/material.dart';

import 'package:furniture_shop_app/screens/home/components/best_selling_view.dart';

import 'package:furniture_shop_app/screens/home/components/sales_view.dart';
import 'package:furniture_shop_app/screens/home/components/collection.dart';
import 'package:furniture_shop_app/screens/home/components/discover_list.dart';
import 'package:furniture_shop_app/screens/home/components/trending_products.dart';
import 'package:furniture_shop_app/style.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Discover",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 18.0,
            ),
            const DiscoverList(),
            const SizedBox(
              height: 18.0,
            ),
            showAll(
              title: "Trending",
            ),
            const SizedBox(
              height: 18.0,
            ),
            const TrendingWidget(),
            const SizedBox(
              height: 40.0,
            ),
            const Collection(),
            const SizedBox(
              height: 18.0,
            ),
            showAll(
              title: "Best Selling",
            ),
            const SizedBox(
              height: 18.0,
            ),
            const BestSelling(),
            const SizedBox(
              height: 40.0,
            ),
            const BlackFriday()
          ],
        ),
      ),
    );
  }

  Row showAll({title}) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const Spacer(),
        InkWell(
          child: Row(
            children: const [
              Text("Show All",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Icon(Icons.arrow_right)
            ],
          ),
        )
      ],
    );
  }
}
