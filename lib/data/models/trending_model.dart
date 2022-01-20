class TrendingModel {
  String? id;
  String? title;
  String? type;
  String? img;
  String? description;
  dynamic sku;
  String? categories;
  String? tags;
  String? dimensions;

  dynamic price;

  TrendingModel(
      {this.img,
      this.id,
      this.price,
      this.title,
      this.description,
      this.categories,
      this.dimensions,
      this.sku,
      this.tags,
      this.type});
  TrendingModel.fromJson(Map<dynamic, dynamic> json) {
    title = json["title"];
    type = json["type"];
    img = json["img"];
    description = json["description"];
    sku = json["sku"];
    categories = json["categories"];
    dimensions = json["dimensions"];
    tags = json["tags"];
    price = json["price"];
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "type": type,
      "img": img,
      "description": description,
      "sku": sku,
      "categories": categories,
      "tags": tags,
      "price": price,
      "dimensions": dimensions,
    };
  }
}
