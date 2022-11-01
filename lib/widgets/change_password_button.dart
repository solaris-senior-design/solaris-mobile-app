import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/utils/constants.dart';

import '../models/user.dart';
import '../screens/change_password_screen.dart';

class ChangePasswordButton extends StatefulWidget {
  final User user;
  const ChangePasswordButton({Key? key, required this.user}) : super(key: key);

  @override
  State<ChangePasswordButton> createState() => _ChangePasswordButtonState();
}

class _ChangePasswordButtonState extends State<ChangePasswordButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (() async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangePasswordScreen(user: widget.user)));
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
