import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String data;
  void Function() onClick;

  AppButton({required this.data, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF00418A),
        minimumSize: Size(250, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),

      child: Text(
        data,
        style: TextStyle(color: Color(0xffffffff)),
      ),
    );
  }
}
