import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/screens/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color(0xDD00B2FF),
      Color(0xFF0076FF),
      Color(0xFF001598),
    ],
  ).createShader(Rect.fromLTWH(50.0, 0.0, 300.0, 70.0));

  @override
  void initState() {
    super.initState();
    nextscreen();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(
      context,
    ).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              margin: EdgeInsetsGeometry.only(
                top: screenHeight * .3,
                bottom: screenHeight * .2,
              ),
              child: Text(
                "TASKATI",
                style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = linearGradient,
                ),
              ),
            ),
            Lottie.asset("assets/splash_loading_icon.json"),
          ],
        ),
      ),
    );
  }

  /// *

  void nextscreen() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthScreen(),
        ),
      );
    });
  }
}
