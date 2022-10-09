import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/utils/constants.dart';

class ChangePasswordButton extends StatefulWidget {
  const ChangePasswordButton({Key? key}) : super(key: key);

  @override
  State<ChangePasswordButton> createState() => _ChangePasswordButtonState();
}

class _ChangePasswordButtonState extends State<ChangePasswordButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (() async {
        // change password stuff here
      }),
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
          side: const BorderSide(color: kThemeDarkGrayColor, width: 2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
      child: const Text(
        "Change Password",
        style: kChangePasswordText,
      ),
    );
  }
}
