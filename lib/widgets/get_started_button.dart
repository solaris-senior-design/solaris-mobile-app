import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/screens/log_in_screen.dart';
import 'package:solaris_mobile_app/utils/constants.dart';

class GetStartedButton extends StatefulWidget {
  const GetStartedButton({Key? key}) : super(key: key);

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (() async {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LogInScreen()));
      }),
      style: TextButton.styleFrom(
          elevation: 5.0,
          padding: const EdgeInsets.fromLTRB(55, 12, 55, 12),
          backgroundColor: kThemePrimaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
      child: const Text(
        'GET STARTED',
        style: kGetStartedButtonText,
      ),
    );
  }
}
