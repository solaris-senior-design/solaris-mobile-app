import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/utils/constants.dart';

class LogInSignInButton extends StatefulWidget {
  final String buttonText;
  const LogInSignInButton({Key? key, required this.buttonText})
      : super(key: key);

  @override
  State<LogInSignInButton> createState() => _LogInSignInButtonState();
}

class _LogInSignInButtonState extends State<LogInSignInButton> {
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
      child: Text(
        widget.buttonText,
        style: kGetStartedButtonText,
      ),
    );
  }
}
