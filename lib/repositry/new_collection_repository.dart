// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:furniture_shop_app/data/models/new_collection_model.dart';

class NewCollectionRepository {
  NewCollectionRepository();

  Future<NewCollectionModel> addNewCollectionFurniture(
      {NewCollectionModel? model,
      addLoading,
      context,
      collection,
      profileImage,
      newCollectionModel}) async {
    try {
      var frebaseStorageRef = firebase_storage.FirebaseStorage.instance
          .ref("new-collection")
          .child(Uri.file(profileImage!.path).pathSegments.last);

      var uploadTask = frebaseStorageRef.putFile(profileImage!);
      var storageSnapShot = await uploadTask.whenComplete(() {});

      model!.img = await storageSnapShot.ref.getDownloadURL();

      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Home").child("new-collection").push();

      await ref.set(model.toJson());
      DatabaseEvent event = await ref.once();
      final json = event.snapshot.value as Map<dynamic, dynamic>;

      newCollectionModel = NewCollectionModel.fromJson(json);

      newCollectionModel!.id = event.snapshot.key;
      collection.add(newCollectionModel!);
    } on FirebaseAuthException catch (e) {
      addLoading();
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text(' Ops! Upload Furniture Failed'),
              content: Text('${e.message}')));
    }

    return newCollectionModel!;
  }

  Future<List<NewCollectionModel>> displayNewCollection(
      {newCollectionModel, collection}) async {
    Query needsSnapshot = FirebaseDatabase.instance
        .ref("Home")
        .child("new-collection")
        .orderByKey();
    List<NewCollectionModel> needs = [];

    Map? content;
    try {
      await needsSnapshot.once().then((value) {
        content = value.snapshot.value as Map<dynamic, dynamic>;
      }).then((value) {});
      content!.forEach((key, value) {
        newCollectionModel = NewCollectionModel.fromJson(value);
        needs.add(newCollectionModel!);
        collection = needs;
      });
    } catch (e) {
      // print(e);
    }

    return needs;
  }
}
