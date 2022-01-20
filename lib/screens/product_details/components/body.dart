import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/models/cart_model.dart';
import 'package:furniture_shop_app/data/models/trending_model.dart';
import 'package:furniture_shop_app/data/provider/cart_provider.dart';

import 'package:furniture_shop_app/screens/product_details/components/also_like_product.dart';
import 'package:furniture_shop_app/screens/product_details/components/colors_widget.dart';
import 'package:furniture_shop_app/screens/product_details/components/product_description.dart';
import 'package:furniture_shop_app/screens/product_details/components/product_image.dart';
import 'package:furniture_shop_app/screens/product_details/components/review.dart';
import 'package:furniture_shop_app/screens/product_details/components/product_rate.dart';

import 'package:furniture_shop_app/widgets/container_button.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.product,
  }) : super(key: key);

  final TrendingModel? product;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Column(
          children: [
            ProductImage(
              imge: widget.product!.img!,
              type: widget.product!.type!,
            ),
            TitleWithRate(
              title: widget.product!.title!,
              price: widget.product!.price,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const ColorsWidget(),
            const SizedBox(
              height: 10.0,
            ),
            AlsoLike(
              productId: widget.product!.id!,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Description(
              description: widget.product!.description!,
              sku: widget.product!.sku,
              categories: widget.product!.categories!,
              dimensions: widget.product!.dimensions!,
              tags: widget.product!.tags!,
            ),
            const Review(),
            const SizedBox(
              height: 10.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Provider.of<CartProvider>(context, listen: false).isloading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ContainerButton(
                      title: "Add to cart".toUpperCase(),
                      submit: () async {
                        Provider.of<CartProvider>(context, listen: false)
                            .addLoading(true);
                        await Provider.of<CartProvider>(context, listen: false)
                            .addProductToCart(
                                context: context,
                                model: CartModel(
                                    img: widget.product!.img,
                                    size: 34,
                                    title: widget.product!.title,
                                    price: widget.product!.price))
                            .then((value) {
                          Provider.of<CartProvider>(context, listen: false)
                              .addLoading(false);

                          showDialog(
                                  context: context,
                                  builder: (ctx) => const AlertDialog(
                                      title: Text(' GOOD JOB'),
                                      content: Text(
                                          'Your Discover Furniture added successfuly ')))
                              .then((value) {});
                        }).catchError((e) {
                          return e;
                        });
                      },
                      color: const Color(0xff242A37),
                      txtColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
