import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:furniture_shop_app/data/models/best_selling_model.dart';
import 'package:furniture_shop_app/repositry/selling_repository.dart';
import 'package:image_picker/image_picker.dart';

class SellingProvider with ChangeNotifier {
  SellingRepository sellingRepository = SellingRepository();
  File? profileImage;
  List<BestSellingModel> selling = [];
  final picker = ImagePicker();
  BestSellingModel? bestSellingModel;
  bool isloading = false;
  void addLoading(bool isload) {
    isloading = isload;
    notifyListeners();
  }

  addSellingProoduct({BestSellingModel? model, context}) async {
    bestSellingModel = await sellingRepository.addBestSellingFurniture(
        context: context,
        model: model,
        addLoading: () => addLoading(true),
        bestSellingModel: bestSellingModel,
        profileImage: profileImage,
        selling: selling);
    notifyListeners();
  }

  displaySellingProduct() async {
    selling = await sellingRepository.displaySelling(
        bestSellingModel: bestSellingModel, selling: selling);
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
