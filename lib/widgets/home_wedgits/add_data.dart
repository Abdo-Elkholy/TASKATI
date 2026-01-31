import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddData extends StatelessWidget {
  DateTime today = DateTime.now();

  Function() addButton;

  AddData({super.key, required this.addButton});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMd().format(today),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text("Today", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(100, 65),
            backgroundColor: Color(0xff4E5AE8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: addButton,
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
    );
  }
}
