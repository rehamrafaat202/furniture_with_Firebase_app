// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:furniture_shop_app/data/models/discover_model.dart';

class FurnitureRepository {
  FurnitureRepository();
  Future<DiscoverModel> addFurnitureDiscover(
      {DiscoverModel? model,
      addLoading,
      context,
      profileImage,
      discoverModel,
      discover}) async {
    try {
      var frebaseStorageRef = firebase_storage.FirebaseStorage.instance
          .ref("discover")
          .child(Uri.file(profileImage!.path).pathSegments.last);

      var uploadTask = frebaseStorageRef.putFile(profileImage!);
      var storageSnapShot = await uploadTask.whenComplete(() {});

      model!.img = await storageSnapShot.ref.getDownloadURL();

      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Home").child("discover").push();

      await ref.set(model.toMap());
      DatabaseEvent event = await ref.once();
      final json = event.snapshot.value as Map<dynamic, dynamic>;

      discoverModel = DiscoverModel.fromJson(json);
      discoverModel!.id = event.snapshot.key;
      discover.add(discoverModel!);
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text(' Ops! Upload Furniture Failed'),
              content: Text('${e.message}')));
    }

    return discoverModel!;
  }

  Future<List<DiscoverModel>> displayDiscover({discoverModel, discover}) async {
    Query needsSnapshot =
        FirebaseDatabase.instance.ref("Home").child("discover").orderByKey();
    List<DiscoverModel> needs = [];
    Map? content;
    try {
      await needsSnapshot.once().then((value) {
        content = value.snapshot.value as Map<dynamic, dynamic>;
      }).then((value) {});
      content!.forEach((key, value) {
        discoverModel = DiscoverModel.fromJson(value);
        needs.add(discoverModel!);
        discover = needs;
      });
    } catch (e) {
      print("no data added yet");
    }

    return needs;
  }
}
