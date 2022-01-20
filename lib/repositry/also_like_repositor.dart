import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/models/also_like_model.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AlsoLikeRepository {
  Future<AlsoLikeModel> addAlsoLike(
      {AlsoLikeModel? model,
      addLoading,
      context,
      profileImage,
      alsoLikeModel,
      also}) async {
    try {
      var frebaseStorageRef = firebase_storage.FirebaseStorage.instance
          .ref("also-like")
          .child(Uri.file(profileImage!.path).pathSegments.last);

      var uploadTask = frebaseStorageRef.putFile(profileImage!);
      var storageSnapShot = await uploadTask.whenComplete(() {});

      model!.image = await storageSnapShot.ref.getDownloadURL();

      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Home").child("also-like").push();

      await ref.set(model.toJson());
      DatabaseEvent event = await ref.once();
      final json = event.snapshot.value as Map<dynamic, dynamic>;

      alsoLikeModel = AlsoLikeModel.fromJson(json);

      alsoLikeModel!.id = event.snapshot.key;
      also.add(alsoLikeModel!);
    } on FirebaseAuthException catch (e) {
      addLoading();
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text(' Ops! Upload Furniture Failed'),
              content: Text('${e.message}')));
    }

    return alsoLikeModel!;
  }

  Future<List<AlsoLikeModel>> displayAlsoLike(
      {required productId, alsoLikeModel, also}) async {
    List<AlsoLikeModel> needs = [];

    Query needsSnapshot =
        FirebaseDatabase.instance.ref("Home").child("also-like");

    Map? content;
    try {
      await needsSnapshot
          .orderByChild("productId")
          .equalTo(productId)
          .once()
          .then((value) {
        content = value.snapshot.value as Map<dynamic, dynamic>;
      });

      content!.forEach((key, value) {
        alsoLikeModel = AlsoLikeModel.fromJson(value);
        needs.add(alsoLikeModel!);
        also = needs;
      });
    } catch (e) {
      print("no data add yet");
    }
    return needs;
  }
}
