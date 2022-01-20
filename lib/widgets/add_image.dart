import 'dart:io';

import 'package:flutter/material.dart';

class AddImage extends StatefulWidget {
  File? profileImage;
  Function getImage;
  AddImage({required this.profileImage, required this.getImage, Key? key})
      : super(key: key);

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: 560,
          decoration: BoxDecoration(
            color: const Color(0xffDBDBCC),
            border: Border.all(width: 1),
            image: widget.profileImage != null
                ? DecorationImage(
                    image: FileImage(
                      widget.profileImage!,
                    ),
                    fit: BoxFit.cover)
                : const DecorationImage(
                    image: NetworkImage(
                      "https://image.freepik.com/free-psd/empty-wall-mock-up-with-home-decorating-living-room-modern-interior_1150-34640.jpg",
                    ),
                    fit: BoxFit.cover),
          ),
        ),
        InkWell(
          onTap: () async {
            await widget.getImage();
          },
          child: Container(
            width: double.infinity,
            height: 50,
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(color: Colors.black38),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  "Add Image",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
