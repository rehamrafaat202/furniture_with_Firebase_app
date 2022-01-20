import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/models/cart_model.dart';

import 'package:furniture_shop_app/repositry/cart_repository.dart';
import 'package:furniture_shop_app/screens/cart/components/cart_item.dart';
import 'package:furniture_shop_app/style.dart';

class AllCarts extends StatefulWidget {
  final List<CartModel> cart;
  const AllCarts({
    required this.cart,
    Key? key,
  }) : super(key: key);

  @override
  State<AllCarts> createState() => _AllCartsState();
}

class _AllCartsState extends State<AllCarts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.cart.length} items",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            height: 15.0,
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.cart.length,
              itemBuilder: (context, index) {
                return CartItem(
                  cart: widget.cart[index],
                );
              }),
        ],
      ),
    );
  }
}
