import 'package:flutter/material.dart';
import 'package:taskati/gen/assets.gen.dart';

class EmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Image.asset(Assets.noTask.path, width: 250),
          const Text(
            "You do not have any task!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
