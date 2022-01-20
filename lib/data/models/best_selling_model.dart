class BestSellingModel {
  String? id;
  String? title;

  String? img;
  dynamic price;

  BestSellingModel({
    this.img,
    this.price,
    this.title,
  });
  BestSellingModel.fromJson(Map<dynamic, dynamic> json) {
    title = json["title"];
    price = json["price"];
    img = json["img"];
  }
  Map<String, dynamic> toJson() {
    return {"title": title, "price": price, "img": img};
  }
}
