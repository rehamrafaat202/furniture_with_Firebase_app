// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:furniture_shop_app/data/models/best_selling_model.dart';

class SellingRepository {
  SellingRepository();

  Future<BestSellingModel> addBestSellingFurniture(
      {BestSellingModel? model,
      addLoading,
      context,
      profileImage,
      bestSellingModel,
      selling}) async {
    try {
      var frebaseStorageRef = firebase_storage.FirebaseStorage.instance
          .ref("best-selling")
          .child(Uri.file(profileImage!.path).pathSegments.last);

      var uploadTask = frebaseStorageRef.putFile(profileImage!);
      var storageSnapShot = await uploadTask.whenComplete(() {});

      model!.img = await storageSnapShot.ref.getDownloadURL();

      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Home").child("best-selling").push();

      await ref.set(model.toJson());
      DatabaseEvent event = await ref.once();
      final json = event.snapshot.value as Map<dynamic, dynamic>;

      bestSellingModel = BestSellingModel.fromJson(json);
      bestSellingModel!.id = event.snapshot.key;
      selling.add(bestSellingModel!);
    } on FirebaseAuthException catch (e) {
      addLoading();
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text(' Ops! Upload Furniture Failed'),
              content: Text('${e.message}')));
    }

    return bestSellingModel!;
  }

  Future<List<BestSellingModel>> displaySelling(
      {bestSellingModel, selling}) async {
    Query needsSnapshot = FirebaseDatabase.instance
        .ref("Home")
        .child("best-selling")
        .orderByKey();
    List<BestSellingModel> needs = [];

    Map? content;
    try {
      await needsSnapshot.once().then((value) {
        content = value.snapshot.value as Map<dynamic, dynamic>;
      }).then((value) {});
      content!.forEach((key, value) {
        bestSellingModel = BestSellingModel.fromJson(value);
        needs.add(bestSellingModel!);
        selling = needs;
      });
    } catch (e) {
      print(e);
    }
    return needs;
  }
}
