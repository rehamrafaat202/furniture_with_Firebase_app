import 'package:flutter/material.dart';
import 'package:furniture_shop_app/style.dart';

class TitleWithRate extends StatefulWidget {
  const TitleWithRate({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  final dynamic price;
  final String title;

  @override
  State<TitleWithRate> createState() => _TitleWithRateState();
}

class _TitleWithRateState extends State<TitleWithRate> {
  bool isFavorite = false;
  void addToFav() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        20.0,
      ),
      decoration: const BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: containerBorder, width: 2))),
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              IconButton(
                onPressed: () {
                  addToFav();
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                  size: 25,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "\$${widget.price}",
                  style: const TextStyle(fontSize: 25, color: Colors.pink),
                ),
              ),
              Row(
                children: [
                  rates(),
                  rates(),
                  rates(),
                  rates(),
                  rates(color: Colors.grey[200])
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  Widget rates({color = Colors.orange}) => Icon(
        Icons.star,
        size: 20.0,
        color: color,
      );
}
