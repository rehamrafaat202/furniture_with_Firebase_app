import 'package:flutter/material.dart';
import 'package:furniture_shop_app/style.dart';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: reviewGroundColor,
          border: Border.symmetric(
              horizontal: BorderSide(color: containerBorder, width: 2))),
      width: double.infinity,
      // height: 200,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Reviews",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                const Spacer(),
                InkWell(
                  child: Row(
                    children: const [
                      Text("125 reviews ", style: TextStyle()),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Container(
                  width: 120,
                  height: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: review.withOpacity(0.6)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "4.8",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white),
                      ),
                      const Text(
                        "Out of 5",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    reviewAvg(title: "Excellent", avg: 0.9),
                    reviewAvg(title: "Very Good", avg: 0.4),
                    reviewAvg(title: "Averge", avg: 0.3),
                    reviewAvg(title: "Poor", avg: 0.2),
                  ],
                )),
              ],
            ),
            const SizedBox(
              height: 9.0,
            ),
            Row(
              children: [
                rates(),
                rates(),
                rates(),
                rates(),
                rates(color: Colors.grey[400])
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget rates({color = Colors.orange}) => Icon(
        Icons.star,
        size: 20.0,
        color: color,
      );

  Widget reviewAvg({title, required double avg}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 8,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth * avg,
                    height: 8,
                    decoration: BoxDecoration(
                        color: review,
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
