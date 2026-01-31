import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/models/user_model.dart';
import 'package:taskati/screens/home_screen.dart';
import 'package:taskati/widgets/app_button.dart';
import 'package:taskati/widgets/app_inputs.dart';

class AuthScreen extends StatefulWidget {
  final UserModel user;

  const AuthScreen({super.key, required this.user});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  XFile? img;
  XFile? photo;
  TextEditingController? data;
  final ImagePicker picker = ImagePicker();

  void openCamera() async {
    img = await picker.pickImage(source: ImageSource.camera);
    widget.user.photo = img?.path;
    setState(() {});
  }

  void openGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    widget.user.photo = photo?.path;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Visibility(
              visible: widget.user.name == null,
              replacement: InkWell(
                child: Text(
                  "Done",
                  style: TextStyle(color: Color(0xff4E5AE8), fontSize: 18),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (c) => HomeScreen(user: widget.user),
                    ),
                    (e) => true,
                  );
                },
              ),
              child: Text(
                "Done",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Visibility(
                visible: widget.user.photo == null,
                replacement: Stack(
                  alignment: AlignmentDirectional(1.2, 1.2),
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: widget.user.photo != null
                          ? FileImage(File(widget.user.photo!))
                          : null,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(50),
                        ),
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        widget.user.photo = null;
                        setState(() {});
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: Color(0xffffffff),
                        size: 30,
                      ),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Color(0xffe3d6d6),
                  radius: 80,
                  child: Icon(
                    color: Color(0xFF4E5AE8),
                    Icons.person,
                    size: 150,
                  ),
                ),
              ),
              SizedBox(height: 20),
              AppButton(data: "Upload From Camera", onClick: openCamera),
              SizedBox(height: 10),
              AppButton(data: "Upload From Gallery", onClick: openGallery),
              SizedBox(height: 15),
              SizedBox(width: 340, child: Divider(height: 50, thickness: 2)),
              SizedBox(
                width: 300,
                child: AppInputs(
                  hint: 'Enter your name',
                  data: data,
                  onChanged: (v) {
                    setState(() {
                      widget.user.name = v.toString();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
