import 'dart:io';

import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final String name;
  final String? userPhoto;
  final VoidCallback? onProfileTap;

  const HomeAppBar({
    super.key,
    required this.name,
    required this.userPhoto,
    this.onProfileTap,
  });

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
        GestureDetector(
          onTap: onProfileTap,
          child: Visibility(
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
                    ? FileImage(File(userPhoto!))
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
