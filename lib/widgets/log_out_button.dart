import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/screens/dashboard_screen.dart';
import 'package:solaris_mobile_app/utils/constants.dart';

import '../models/user.dart';

class LogOutButton extends StatefulWidget {
  final User user;
  const LogOutButton({Key? key, required this.user}) : super(key: key);

  @override
  State<LogOutButton> createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (() async {
        Navigator.pop(
            context,
            MaterialPageRoute(
                builder: (context) => DashboardScreen(user: widget.user)));
      }),
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
          side: const BorderSide(color: kThemeTertiaryColor, width: 2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
      child: const Text(
        "Log out",
        style: kUserProfileButtonText,
      ),
    );
  }
}
