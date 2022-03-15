import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(
        const AssetImage("assets/images/splash_ellipse.png"), context);
    precacheImage(
        const AssetImage("assets/images/undraw_visual_data_re_mxxo 1.png"),
        context);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
