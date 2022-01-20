import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:furniture_shop_app/data/models/cart_model.dart';

import 'package:furniture_shop_app/repositry/cart_repository.dart';

class CartProvider with ChangeNotifier {
  CartRepository cartRepository = CartRepository();
  File? profileImage;
  CartModel? cartModel;
  bool isloading = false;
  List<CartModel> cart = [];
  void addLoading(bool isload) {
    isloading = isload;
    notifyListeners();
  }

  addProductToCart({CartModel? model, context}) async {
    cartModel = await cartRepository.addToCart(
        context: context,
        cartModel: cartModel,
        model: model,
        addLoading: () => addLoading(true),
        cart: cart);
    notifyListeners();
  }

  displayInCart() async {
    cart = await cartRepository.displayCart(cart: cart, cartModel: cartModel);
    notifyListeners();
  }
}
