import 'package:flutter/material.dart';

class task extends StatelessWidget {
  int taskColor;

  task({required this.taskColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(8),
      height: 125,
      decoration: BoxDecoration(
        color: Color(taskColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: [
              Text(
                "data",
                style: TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  Icon(Icons.alarm, color: Colors.white),
                  Text(
                    "data",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Text(
                "data",
                style: TextStyle(color: Colors.white),
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
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
