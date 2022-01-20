import 'package:flutter/material.dart';
import 'package:furniture_shop_app/style.dart';

class ColorsWidget extends StatefulWidget {
  const ColorsWidget({Key? key}) : super(key: key);

  @override
  State<ColorsWidget> createState() => _ColorsWidgetState();
}

class _ColorsWidgetState extends State<ColorsWidget> {
  bool isTaped = false;
  int currentIndex = 0;
  void addContainer(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(
          20.0,
        ),
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: containerBorder, width: 2))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Colors",
            style: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: col.length,
                itemBuilder: (context, index) {
                  return choseColor(
                      color: col[index],
                      index: index,
                      currentIndex: currentIndex,
                      addContainer: () => addContainer(index));
                }),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ]));
  }

  Widget choseColor({
    color,
    index,
    currentIndex,
    addContainer,
  }) {
    return InkWell(
      onTap: addContainer,
      child: Container(
          margin: const EdgeInsets.only(right: 8.0),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: currentIndex == index
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 28,
                  ),
                )
              : Container()),
    );
  }
}
