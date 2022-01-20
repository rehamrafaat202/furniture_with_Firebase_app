import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/models/new_collection_model.dart';

import 'package:furniture_shop_app/repositry/new_collection_repository.dart';
import 'package:image_picker/image_picker.dart';

class NewCollectionProvider with ChangeNotifier {
  NewCollectionRepository newCollectionRepository = NewCollectionRepository();
  File? profileImage;
  List<NewCollectionModel> collection = [];
  final picker = ImagePicker();
  NewCollectionModel? newCollectionModel;
  bool isloading = false;
  void addLoading(bool isload) {
    isloading = isload;
    notifyListeners();
  }

  addNewCollectionProduct({NewCollectionModel? model, context}) async {
    newCollectionModel =
        await newCollectionRepository.addNewCollectionFurniture(
      addLoading: () => addLoading(true),
      model: model,
      context: context,
      collection: collection,
      newCollectionModel: newCollectionModel,
      profileImage: profileImage,
    );
    notifyListeners();
  }

  displayNewCollectionProduct() async {
    collection = await newCollectionRepository.displayNewCollection(
        collection: collection, newCollectionModel: newCollectionModel);
    notifyListeners();
  }

  Future getImage({context}) async {
    final picked = await picker.getImage(source: ImageSource.gallery);

    if (picked != null) {
      profileImage = File(picked.path);
    }
    notifyListeners();
  }
}
