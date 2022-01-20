import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/provider/discover_provider.dart';

import 'package:furniture_shop_app/style.dart';
import 'package:provider/provider.dart';

class DiscoverList extends StatefulWidget {
  const DiscoverList({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscoverList> createState() => _DiscoverListState();
}

class _DiscoverListState extends State<DiscoverList> {
  bool isLoading = false;
  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Provider.of<DiscoverProvider>(context, listen: false)
        .displayDiscoverProduct()
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
    return Consumer<DiscoverProvider>(builder: (ctx, model, child) {
      return isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: 250,
              margin: const EdgeInsets.only(right: 10),
              child: model.discover.isEmpty
                  ? Container(
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 200,
                        width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: primaryColor),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.black38,
                            child: const Text(
                              "No items added yet",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model.discover.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 250,
                                width: 170,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        model.discover[index].img!,
                                      ),
                                      // fit: BoxFit.cover,
                                    ),
                                    color: primaryColor),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 10),
                              child: Text(
                                model.discover[index].title!,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                  "${model.discover[index].numOfItems!} items",
                                  style: const TextStyle(
                                      color: containerGround,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        );
                      }),
            );
    });
  }
}
