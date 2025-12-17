import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/screens/home_screen.dart';
import 'package:taskati/widgets/app_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  XFile? image;
  String? userName;
  final TextEditingController name =
      TextEditingController();

  void openCamera() async {
    photo = await picker.pickImage(
      source: ImageSource.camera,
    );
    image = null;
    setState(() {});
  }

  void openGallery() async {
    image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    photo = null;
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
              visible: name.text == "",
              replacement: InkWell(
                child: Text(
                  "Done",
                  style: TextStyle(
                    color: Color(0xff4E5AE8),
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  String s = name.text;
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (c) => HomeScreen(
                        name: s,
                        userPhoto: photo ?? image ?? null,
                      ),
                    ),
                    (e) => true,
                  );
                },
              ),
              child: Text(
                "Done",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
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
                visible: photo == null && image == null,
                replacement: Stack(
                  alignment: AlignmentDirectional(1.2, 1.2),
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: photo != null
                          ? FileImage(File(photo!.path))
                          : (image != null
                                ? FileImage(
                                    File(image!.path),
                                  )
                                : null),
                    ),
                    IconButton(
                      onPressed: () {
                        photo = null;
                        image = null;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Color(0xffFF8746),
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
              AppButton(
                data: "Upload From Camera",
                onClick: openCamera,
              ),
              SizedBox(height: 10),
              AppButton(
                data: "Upload From Gallery",
                onClick: openGallery,
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 340,
                child: Divider(height: 50, thickness: 2),
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: name,

                  onTapOutside: (value) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF00418A),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    label: Text("enter your name"),
                    labelStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
