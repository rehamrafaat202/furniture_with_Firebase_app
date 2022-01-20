import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:furniture_shop_app/data/models/also_like_model.dart';
import 'package:furniture_shop_app/data/models/trending_model.dart';

import 'package:furniture_shop_app/repositry/also_like_repositor.dart';
import 'package:image_picker/image_picker.dart';

class AlsoLikeProvider with ChangeNotifier {
  AlsoLikeRepository alsoLikeRepository = AlsoLikeRepository();
  File? profileImage;
  AlsoLikeModel? alsoLikeModel;
  List<AlsoLikeModel> also = [];

  final picker = ImagePicker();
  TrendingModel? trendingModel;
  List<TrendingModel> trend = [];

  bool isloading = false;
  void addLoading(bool isload) {
    isloading = isload;
    notifyListeners();
  }

  addAlsoLikeProduct({AlsoLikeModel? model, context}) async {
    alsoLikeModel = await alsoLikeRepository.addAlsoLike(
        addLoading: () => addLoading(true),
        alsoLikeModel: alsoLikeModel,
        profileImage: profileImage,
        context: context,
        model: model,
        also: also);
    notifyListeners();
  }

  displayAlsoLikeProduct({required productId}) async {
    also = await alsoLikeRepository.displayAlsoLike(
        productId: productId, also: also, alsoLikeModel: alsoLikeModel);
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
