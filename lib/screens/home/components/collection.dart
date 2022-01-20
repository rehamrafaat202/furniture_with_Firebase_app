import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/provider/new_collection_provider.dart';

import 'package:furniture_shop_app/repositry/new_collection_repository.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:provider/provider.dart';

class Collection extends StatefulWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<NewCollectionProvider>(context, listen: false)
            .displayNewCollectionProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Text('${snapshot.data}');
            } else {
              return Consumer<NewCollectionProvider>(
                  builder: (ctx, data, child) {
                return data.collection.isEmpty
                    ? Container(
                        margin: const EdgeInsets.all(10),
                        width: 320,
                        height: 250,
                        decoration: BoxDecoration(
                          color: banner,
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            color: Colors.black38,
                            child: const Text(
                              "No items added yet",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ))
                    : SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: data.collection.length,
                          itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.all(10),
                              width: 320,
                              decoration: BoxDecoration(
                                color: banner,
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 3,
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Stack(children: [
                                Positioned(
                                  top: 25.0,
                                  right: 15.0,
                                  child: Image.network(
                                    data.collection[index].img!,
                                    width: 200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Collection",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        width: 150,
                                        padding: const EdgeInsets.all(8.0),
                                        child:
                                            Text(data.collection[index].title!,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 29,
                                                )),
                                      ),
                                      const Spacer(),
                                      Container(
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Shop now".toUpperCase(),
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                const Icon(Icons.arrow_right)
                                              ],
                                            ),
                                            const Divider(
                                              color: Colors.black,
                                              thickness: 1,
                                              height: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ])),
                        ),
                      );
              });
            }
          }
        });
  }
}
