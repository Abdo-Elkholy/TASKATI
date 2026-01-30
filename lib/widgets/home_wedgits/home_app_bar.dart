import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeAppBar extends StatelessWidget {
  String name;
  XFile? userPhoto;

  HomeAppBar({super.key, required this.name, required this.userPhoto});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello $name",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(color: Colors.blue),
            ),
            const Text("Have A Nice Day."),
          ],
        ),
        Visibility(
          visible: userPhoto != null,
          replacement: CircleAvatar(
            radius: 23,
            backgroundColor: Color(0xff4E5AE8),
            child: CircleAvatar(
              backgroundColor: Color(0xffe3d6d6),
              radius: 20,
              child: Icon(color: Color(0xFF00418A), Icons.person, size: 30),
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 23,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: userPhoto != null
                  ? FileImage(File(userPhoto!.path))
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
