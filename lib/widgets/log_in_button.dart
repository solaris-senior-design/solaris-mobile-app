import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/globals/globals.dart';
import 'package:solaris_mobile_app/screens/dashboard_screen.dart';
import 'package:solaris_mobile_app/utils/constants.dart';

import '../models/network_helper.dart';

class LogInButton extends StatefulWidget {
  final Map<String, String> apiCall;
  const LogInButton({Key? key, required this.apiCall}) : super(key: key);

  @override
  State<LogInButton> createState() => _LogInButtonState();
}

class _LogInButtonState extends State<LogInButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (() async {
        print(widget.apiCall);
        bool response = await NetworkHelper.sendData(
            httpClient,
            Uri(
                scheme: 'https',
                host: 'solaris-web-server.herokuapp.com',
                path: 'sign_in'),
            widget.apiCall);

        if (response) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()));
        }
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
