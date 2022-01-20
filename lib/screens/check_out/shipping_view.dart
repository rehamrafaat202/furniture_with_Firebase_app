import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/models/shipping_model.dart';
import 'package:furniture_shop_app/style.dart';

class ShippingView extends StatefulWidget {
  const ShippingView({Key? key}) : super(key: key);

  @override
  State<ShippingView> createState() => _ShippingViewState();
}

class _ShippingViewState extends State<ShippingView> {
  int currentIndex = 0;
  void chosePlace(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Shipping to",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        Container(
          height: 80,
          margin: EdgeInsets.symmetric(vertical: 20.0),
          child: ListView.builder(
              itemCount: ship.length,
              scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    chosePlace(index);
                  },
                  child: Container(
                    width: 270,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: reviewGroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0.2, 0.2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10.0),
                            width: 40,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white),
                            child: const Icon(
                              Icons.home,
                              color: review,
                            ),
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ship[index].address,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ship[index].city,
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          )),
                          if (index == currentIndex)
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: review),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18,
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
