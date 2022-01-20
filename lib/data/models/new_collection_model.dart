class NewCollectionModel {
  String? img;
  String? id;
  String? title;
  NewCollectionModel({this.img, this.title});
  NewCollectionModel.fromJson(Map<dynamic, dynamic> json) {
    img = json["img"];
    title = json["title"];
  }
  Map<String, dynamic> toJson() {
    return {"img": img, "title": title};
  }
}
