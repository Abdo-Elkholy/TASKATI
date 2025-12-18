import 'package:flutter/material.dart';

class date extends StatelessWidget {
  bool isActive = false;

  date({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isActive
              ? Color(0xff4E5AE8)
              : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsetsGeometry.only(right: 5, left: 5),
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "oct",
              style: TextStyle(
                color: isActive
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            Text(
              "28",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive
                    ? Colors.white
                    : Colors.black,
                fontSize: 20,
              ),
            ),
            Text(
              "mon",
              style: TextStyle(
                color: isActive
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
