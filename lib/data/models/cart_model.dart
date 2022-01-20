import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel {
  String? id;
  String? img;
  String? title;
  dynamic size;
  Color? col;
  String? txtcol;
  dynamic price;
  CartModel(
      {this.img,
      this.id,
      this.col,
      this.size,
      this.title,
      this.price,
      this.txtcol});

  CartModel.fromJson(Map<dynamic, dynamic> json) {
    img = json["img"];
    title = json["title"];
    size = json["size"];

    price = json["price"];
  }
  Map<String, dynamic> toJson() {
    return {"img": img, "title": title, "size": size, "price": price};
  }
}
