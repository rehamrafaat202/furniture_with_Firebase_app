import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/provider/selling_provider.dart';

import 'package:furniture_shop_app/style.dart';
import 'package:provider/provider.dart';

class BestSelling extends StatefulWidget {
  const BestSelling({Key? key}) : super(key: key);

  @override
  State<BestSelling> createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling> {
  bool isLoading = false;
  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Provider.of<SellingProvider>(context, listen: false)
        .displaySellingProduct()
        .then((value) {
      setState(() {
        isLoading = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SellingProvider>(builder: (context, data, child) {
      return isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : data.selling.isEmpty
              ? Container(
                  margin: const EdgeInsets.only(right: 20, bottom: 20),
                  height: 130,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: containerGround),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.black38,
                      child: const Text(
                        "No items added yet",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                  ))
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.selling.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(
                                    right: 20, bottom: 20),
                                height: 130,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: containerGround),
                                child: Image.network(
                                  data.selling[index].img!,
                                )),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.selling[index].title!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      data.selling[index].price!,
                                      style: const TextStyle(
                                        color: containerGround,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      width: 90,
                                      color: Colors.black,
                                      child: const Text(
                                        "Shop",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 120, bottom: 10),
                          width: double.infinity,
                          height: 1,
                          color: Colors.black12,
                        ),
                      ],
                    );
                  });
    });
  }
}
