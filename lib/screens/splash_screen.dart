import 'dart:async';
import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/screens/get_started_screen.dart';
import '../utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const GetStartedScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeOffWhiteColor,
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: const [
            Center(
              child: Text(
                'solaris',
                style: kSplashLogoTextStyle,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:
                  Image(image: AssetImage("assets/images/splash_ellipse.png")),
            )
          ],
        ),
      ),
    );
  }
}
