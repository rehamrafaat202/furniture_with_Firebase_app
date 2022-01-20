import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String description;
  final dynamic sku;
  final String categories;
  final String tags;
  final String dimensions;
  const Description(
      {required this.description,
      required this.categories,
      required this.dimensions,
      required this.sku,
      required this.tags,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Description",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15.0,
          ),
          defaultFeature(title: "SKU", result: sku, context: context),
          defaultFeature(
              title: "Categories", result: categories, context: context),
          defaultFeature(title: "Tags", result: tags, context: context),
          defaultFeature(
              title: "Dimensions", result: dimensions, context: context),
          const SizedBox(
            height: 20.0,
          ),
          defaultCareAndReturn(title: "compostion and cate".toUpperCase()),
          const SizedBox(
            height: 15.0,
          ),
          defaultCareAndReturn(title: "shipping and return".toUpperCase()),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  Widget defaultFeature({title, result, context}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            title,
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey[500],
                fontWeight: FontWeight.bold),
          )),
          Expanded(
              child: Text(
            "$result",
            style: const TextStyle(
                fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }

  Widget defaultCareAndReturn({title}) {
    return InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.arrow_left,
              size: 23,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ));
  }
}
