class AlsoLikeModel {
  String? id;
  String? image;
  String? productId;
  dynamic price;
  String? title;
  AlsoLikeModel({this.id, this.image, this.productId, this.price, this.title});
  AlsoLikeModel.fromJson(Map<dynamic, dynamic> json) {
    image = json["image"];
    price = json["price"];
    title = json["title"];
    productId = json["productId"];
  }
  Map<String, dynamic> toJson() {
    return {
      "image": image,
      "price": price,
      "productId": productId,
      "title": title
    };
  }
}
