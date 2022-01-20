import 'package:flutter/material.dart';
import 'package:furniture_shop_app/screens/filters/components/brand_view.dart';
import 'package:furniture_shop_app/screens/filters/components/colors.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double height = 100;
  RangeValues _currentRangeValues = const RangeValues(40.00, 1000.00);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Filters",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Divider(),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Filter By Price",
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
              RangeSlider(
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey[200],
                  values: _currentRangeValues,
                  // value: height,
                  max: 2000,
                  min: 20,
                  onChanged: (val) {
                    setState(() {
                      _currentRangeValues = val;
                    });
                    // print(_currentRangeValues.start.floorToDouble());
                  }),
              Row(
                children: [
                  Text(
                    "\$ ${_currentRangeValues.start.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  const Spacer(),
                  Text(
                    "\$ ${_currentRangeValues.end.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Brand(
                title: "Brand",
                subtitle1: "Hooker",
                subtitle2: "Aspan",
              ),
              const Brand(
                title: "Categories",
                subtitle1: "Decoration",
                subtitle2: "Lamp",
              ),
              const ColorsWidget(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.black,
              child: Center(
                child: Text(
                  "APPLY",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
