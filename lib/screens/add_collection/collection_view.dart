import 'package:flutter/material.dart';
import 'package:furniture_shop_app/screens/add_collection/best_selling_collection.dart';
import 'package:furniture_shop_app/screens/add_collection/discover_collection_screen.dart';
import 'package:furniture_shop_app/screens/add_collection/new_collection.dart';
import 'package:furniture_shop_app/screens/add_collection/trending_collection.dart';
import 'package:furniture_shop_app/style.dart';

class CollectionView extends StatelessWidget {
  const CollectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: defaultCollection(
                            title: "Trending Collection",
                            image:
                                "https://image.freepik.com/free-psd/modern-furniture-instagram-post-set-premium-psd_174241-88.jpg",
                            function: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (conttext) =>
                                          const TrendingCollection()));
                            }),
                      ),
                      Expanded(
                        child: defaultCollection(
                            title: "Best Selling Collection",
                            image:
                                "https://image.freepik.com/free-psd/modern-furniture-social-media-post-template-collection-premium-psd_174241-87.jpg",
                            function: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (conttext) =>
                                          const BestSellingCollection()));
                            }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: defaultCollection(
                            title: "Discover Collection",
                            image:
                                "https://image.freepik.com/free-psd/modern-furniture-social-media-post-template-collection_174241-15.jpg",
                            function: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (conttext) =>
                                          const AddDiscoverScreen()));
                            }),
                      ),
                      Expanded(
                        child: defaultCollection(
                            title: "New Collection",
                            image:
                                "https://image.freepik.com/free-psd/modern-furniture-social-media-post-template-collection_174241-16.jpg",
                            function: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (conttext) =>
                                          const AddCollectionScreen()));
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget defaultCollection({title, image, function}) {
    return Column(
      children: [
        InkWell(
          onTap: () => function(),
          child: Container(
              margin: const EdgeInsets.only(right: 10),
              height: 250,
              width: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black54,
                ),
                child: const Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Center(
            child: Text(title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ),
        )
      ],
    );
  }
}
