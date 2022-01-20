import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:furniture_shop_app/data/models/also_like_model.dart';
import 'package:furniture_shop_app/data/models/trending_model.dart';

import 'package:furniture_shop_app/repositry/trending_repository.dart';
import 'package:image_picker/image_picker.dart';

class TrendingProvider with ChangeNotifier {
  TrendingRepository trendingRepository = TrendingRepository();
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

  addTrendingProduct({TrendingModel? model, context}) async {
    trendingModel = await trendingRepository.addTrendingFurniture(
        context: context,
        profileImage: profileImage,
        trendingModel: trendingModel,
        model: model,
        trend: trend,
        addLoading: () => addLoading(true));
    notifyListeners();
  }

  displayTrendingProduct() async {
    trend = await trendingRepository.displayTrending(
        trend: trend, trendingModel: trendingModel);
    notifyListeners();
  }

  Future getImage({
    context,
  }) async {
    final picked = await picker.getImage(source: ImageSource.gallery);

    if (picked != null) {
      profileImage = File(picked.path);
    }
    notifyListeners();
  }
}
