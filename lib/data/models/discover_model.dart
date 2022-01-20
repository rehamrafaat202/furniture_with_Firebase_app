class DiscoverModel {
  String? id;
  String? title;
  String? img;
  String? numOfItems;
  DiscoverModel({this.id, this.img, this.numOfItems, this.title});
  DiscoverModel.fromJson(Map<dynamic, dynamic> json) {
    title = json["title"];
    img = json["img"];
    numOfItems = json["numOfItems"];
  }
  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "img": img,
      "numOfItems": numOfItems,
    };
  }
}
