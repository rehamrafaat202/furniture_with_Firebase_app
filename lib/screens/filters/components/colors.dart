import 'package:flutter/material.dart';
import 'package:furniture_shop_app/style.dart';

class ColorsWidget extends StatefulWidget {
  const ColorsWidget({Key? key}) : super(key: key);

  @override
  State<ColorsWidget> createState() => _ColorsWidgetState();
}

class _ColorsWidgetState extends State<ColorsWidget> {
  int currentIndex = 0;
  void addBorder(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Colors",
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: col.length,
                itemBuilder: (context, index) {
                  return choseColor(
                      color: col[index],
                      index: index,
                      currentIndex: currentIndex,
                      addBorder: () => addBorder(index));
                }),
          )
        ]));
  }

  Widget choseColor({
    color,
    index,
    currentIndex,
    addBorder,
  }) {
    return InkWell(
      onTap: addBorder,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(width: index == currentIndex ? 2 : 0)),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          // padding: EdgeInsets.all(10),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(color: Colors.white)),
        ),
      ),
    );
  }
}
