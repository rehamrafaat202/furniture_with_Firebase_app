// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:furniture_shop_app/data/models/user_model.dart';

import 'package:furniture_shop_app/repositry/auth_repositry.dart';
import 'package:image_picker/image_picker.dart';

class AuthProvider with ChangeNotifier {
  AuthRepositry authRepositry = AuthRepositry();
  UserModel? data;
  File? profileImage;
  final picker = ImagePicker();
  bool isloading = false;
  void addLoading(bool isload) {
    isloading = isload;
    notifyListeners();
  }

  getuserLogin({
    emailController,
    passwordController,
    context,
    addLoading,
  }) async {
    data = await authRepositry
        .userLogin(
            data2: data,
            addLoading: addLoading,
            context: context,
            emailController: emailController,
            passwordController: passwordController)
        .catchError((e) {
      return e.toString();
    });
    notifyListeners();
  }

  getuserRegister(
      {emailController,
      passwordController,
      addLoading,
      context,
      required model}) async {
    data = await authRepositry
        .userRegister(
            model: model,
            emailController: emailController,
            addLoading: addLoading,
            context: context,
            data: data,
            profileImage: profileImage,
            passwordController: passwordController)
        .catchError((e) {
      return e.toString();
    });
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
