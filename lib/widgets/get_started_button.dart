import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/utils/constants.dart';

class GetStartedButton extends StatefulWidget {
  final Widget nextScreen;

  const GetStartedButton({Key? key, required this.nextScreen})
      : super(key: key);

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (() => Navigator.push(
          context, MaterialPageRoute(builder: (context) => widget.nextScreen))),
      style: TextButton.styleFrom(
          elevation: 5.0,
          padding: const EdgeInsets.fromLTRB(55, 12, 55, 12),
          backgroundColor: kThemePrimaryColor,
          primary: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
      child: const Text(
        'GET STARTED',
        style: kGetStartedButtonText,
      ),
    );
  }
}
