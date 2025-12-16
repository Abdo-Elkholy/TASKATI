import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/widgets/app_button.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  XFile? image;

  void OpenCamera() async {
    photo = await picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {});
  }

  void OpenGallery() async {
    image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            photo == null && image == null
                ? CircleAvatar(
                    backgroundColor: Color(0xFFC3D1FF),
                    radius: 80,
                    child: Icon(
                      color: Color(0xFF00418A),
                      Icons.person,
                      size: 120,
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: Color(0xFFC3D1FF),
                    radius: 80,
                    backgroundImage: photo != null
                        ? Image.file(
                            File(photo!.path),
                          ).image
                        : Image.file(
                            File(image!.path),
                          ).image,
                  ),
            SizedBox(height: 20),
            AppButton(
              data: "Upload From Camera",
              onClick: OpenCamera,
            ),
            SizedBox(height: 10),
            AppButton(
              data: "Upload From Gallery",
              onClick: OpenGallery,
            ),
          ],
        ),
      ),
    );
  }
}
