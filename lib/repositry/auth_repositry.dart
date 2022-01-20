// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:furniture_shop_app/data/models/user_model.dart';

class AuthRepositry {
  Future<UserModel> userRegister(
      {required UserModel model,
      emailController,
      passwordController,
      addLoading,
      profileImage,
      data,
      context}) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) async {
        var frebaseStorageRef = firebase_storage.FirebaseStorage.instance
            .ref()
            .child(Uri.file(profileImage!.path).pathSegments.last);

        var uploadTask = frebaseStorageRef.putFile(profileImage!);
        var storageSnapShot = await uploadTask.whenComplete(() {});

        model.image = await storageSnapShot.ref.getDownloadURL();

        DatabaseReference ref =
            FirebaseDatabase.instance.ref("users").child(value.user!.uid);

        await ref.set(model.toMap());
        DatabaseEvent event = await ref.once();
        final json = event.snapshot.value as Map<dynamic, dynamic>;
        data = UserModel.fromJson(json);

        return value;
      });
    } on FirebaseAuthException catch (e) {
      addLoading();
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text(' Ops! Registration Failed'),
              content: Text('${e.message}')));
    }

    return data!;
  }

  Future<UserModel> userLogin(
      {emailController, passwordController, context, addLoading, data2}) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) async {
        DatabaseReference ref =
            FirebaseDatabase.instance.ref("users").child(value.user!.uid);
        DatabaseEvent event = await ref.once();
        final json = event.snapshot.value as Map<dynamic, dynamic>;
        data2 = UserModel.fromJson(json);

        return value;
      });
    } on FirebaseAuthException catch (e) {
      addLoading();
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text(' Ops! Login Failed'),
              content: Text('${e.message}')));
    }

    return data2!;
  }
}
