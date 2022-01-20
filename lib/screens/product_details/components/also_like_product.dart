import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/provider/also_like_provider.dart';

import 'package:furniture_shop_app/style.dart';
import 'package:provider/provider.dart';

class AlsoLike extends StatefulWidget {
  final String? productId;
  const AlsoLike({required this.productId, Key? key}) : super(key: key);

  @override
  State<AlsoLike> createState() => _AlsoLikeState();
}

class _AlsoLikeState extends State<AlsoLike> {
  bool isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Provider.of<AlsoLikeProvider>(context, listen: false)
        .displayAlsoLikeProduct(productId: widget.productId)
        .then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AlsoLikeProvider>(builder: (context, data, child) {
      return Container(
        padding: const EdgeInsets.all(
          20.0,
        ),
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: containerBorder, width: 2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "You may also like",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
            ),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: data.also.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                        right: 20,
                      ),
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              data.also[index].image!,
                            ),
                            fit: BoxFit.cover,
                          ),
                          color: containerGround),
                    );
                  }),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      );
    });
  }
}
