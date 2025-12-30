import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

class TaskatiApp extends StatelessWidget {
  const TaskatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen(), debugShowCheckedModeBanner: false);
  }
}
