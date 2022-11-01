import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ConfirmButton extends StatefulWidget {
  final TextEditingController oldPassword;
  final TextEditingController newPassword;
  final TextEditingController newPasswordConfirm;
  const ConfirmButton(
      {Key? key,
      required this.oldPassword,
      required this.newPassword,
      required this.newPasswordConfirm})
      : super(key: key);

  @override
  State<ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (() async {
        // change password stuff
        Navigator.pop(context);
      }),
      style: TextButton.styleFrom(
          elevation: 5.0,
          padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
          backgroundColor: kThemePrimaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
      child: const Text(
        "CONFIRM",
        style: kGetStartedButtonText,
      ),
    );
  }
}
