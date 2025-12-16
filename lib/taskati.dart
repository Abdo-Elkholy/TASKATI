import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

class TaskatiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
