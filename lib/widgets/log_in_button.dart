import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/utils/constants.dart';

class LogInButton extends StatefulWidget {
  const LogInButton({Key? key}) : super(key: key);

  @override
  State<LogInButton> createState() => _LogInButtonState();
}

class _LogInButtonState extends State<LogInButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (() async {
        // api call here
      }),
      style: TextButton.styleFrom(
          elevation: 5.0,
          padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
          backgroundColor: kThemePrimaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
      child: const Text(
        "LOG IN",
        style: kGetStartedButtonText,
      ),
    );
  }
}
