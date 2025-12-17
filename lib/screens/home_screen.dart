import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff4E5AE8),
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      margin: EdgeInsetsGeometry.only(
                        right: 5,
                        left: 5,
                      ),
                      height: 130,
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "oct",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "28",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "mon",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      margin: EdgeInsetsGeometry.only(
                        right: 5,
                        left: 5,
                      ),
                      height: 130,
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                        children: [
                          Text("oct"),
                          Text("28"),
                          Text("mon"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      margin: EdgeInsetsGeometry.only(
                        right: 5,
                        left: 5,
                      ),
                      height: 130,
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                        children: [
                          Text("oct"),
                          Text("28"),
                          Text("mon"),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      margin: EdgeInsetsGeometry.only(
                        right: 5,
                        left: 5,
                      ),
                      height: 130,
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                        children: [
                          Text("oct"),
                          Text("28"),
                          Text("mon"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsetsGeometry.all(8),
                        height: 141,
                        decoration: BoxDecoration(
                          color: Color(0xff4E5AE8),
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceAround,
                              children: [
                                Text(
                                  "data",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.alarm,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "data",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "data",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Container(
                                  width: 1,
                                  height: 100,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "TODO",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsetsGeometry.all(8),
                        height: 141,
                        decoration: BoxDecoration(
                          color: Color(0xffFF4667),
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceAround,
                              children: [
                                Text(
                                  "data",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.alarm,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "data",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "data",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Container(
                                  width: 1,
                                  height: 100,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "TODO",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsetsGeometry.all(8),
                        height: 141,
                        decoration: BoxDecoration(
                          color: Color(0xffFF8746),
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceAround,
                              children: [
                                Text(
                                  "data",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.alarm,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "data",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "data",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Container(
                                  width: 1,
                                  height: 100,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "TODO",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
