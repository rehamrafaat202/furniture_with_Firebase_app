import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/models/discover_model.dart';
import 'package:furniture_shop_app/repositry/discover_repository.dart';
import 'package:image_picker/image_picker.dart';

class DiscoverProvider with ChangeNotifier {
  FurnitureRepository furnitureRepository = FurnitureRepository();
  File? profileImage;
  List<DiscoverModel> discover = [];

  final picker = ImagePicker();
  DiscoverModel? discoverModel;
  bool isloading = false;
  void addLoading(bool isload) {
    isloading = isload;
    notifyListeners();
  }

  addDiscoverProduct({DiscoverModel? model, context}) async {
    discoverModel = await furnitureRepository.addFurnitureDiscover(
        model: model,
        addLoading: () => addLoading(true),
        context: context,
        discover: discover,
        discoverModel: discoverModel,
        profileImage: profileImage);
    notifyListeners();
  }

  displayDiscoverProduct() async {
    discover = await furnitureRepository.displayDiscover(
        discover: discover, discoverModel: discoverModel);
    notifyListeners();
  }

  Future getImage({context}) async {
    final picked = await picker.getImage(source: ImageSource.gallery);

    notifyListeners();
    if (picked != null) {
      profileImage = File(picked.path);
    }
  }
}
