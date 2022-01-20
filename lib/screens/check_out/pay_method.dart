import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/models/pay_model.dart';
import 'package:furniture_shop_app/style.dart';

class PayMethods extends StatefulWidget {
  const PayMethods({Key? key}) : super(key: key);

  @override
  _PayMethodsState createState() => _PayMethodsState();
}

class _PayMethodsState extends State<PayMethods> {
  int currentIndex = 0;
  void chosePayMethod(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Payment Methods",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
      SizedBox(
        height: 20.0,
      ),
      Container(
        width: double.infinity,
        height: 320,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: reviewGroundColor)),
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: methods.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  chosePayMethod(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: methods.length - 1 == index
                        ? Colors.transparent
                        : containerBorder,
                  ))),
                  // width: 270,
                  margin: const EdgeInsets.all(10.0),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  methods[index].img,
                                ),
                              ),
                              shape: BoxShape.circle,
                              color: reviewGroundColor),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              methods[index].type,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              methods[index].method,
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
    ]);
  }
}
