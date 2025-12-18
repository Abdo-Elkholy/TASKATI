import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/widgets/task.dart';
import 'package:taskati/widgets/date.dart';

class HomeScreen extends StatelessWidget {
  String name;
  XFile? userPhoto;

  HomeScreen({
    super.key,
    required this.name,
    this.userPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello $name",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      Text("Have A Nice Day."),
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
                        child: Icon(
                          color: Color(0xFF00418A),
                          Icons.person,
                          size: 30,
                        ),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 23,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: userPhoto != null
                            ? FileImage(
                                File(userPhoto!.path),
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "October 30, 2023",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Today",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 65),
                      backgroundColor: Color(0xff4E5AE8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "+ Add Task",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  date(isActive: false),
                  date(isActive: true),
                  date(isActive: false),
                  date(isActive: false),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      task(taskColor: 0xff4E5AE8),
                      SizedBox(height: 10),
                      task(taskColor: 0xffFF4667),
                      SizedBox(height: 10),
                      task(taskColor: 0xffFF8746),
                    ],
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
