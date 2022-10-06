import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/utils/constants.dart';

class SignUpButton extends StatefulWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
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
        "SIGN UP",
        style: kGetStartedButtonText,
      ),
    );
  }
}
