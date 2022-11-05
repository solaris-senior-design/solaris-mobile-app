import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:solaris_mobile_app/globals/globals.dart';
import 'package:solaris_mobile_app/screens/dashboard_screen.dart';
import 'package:solaris_mobile_app/utils/constants.dart';

import '../models/network_helper.dart';
import '../models/user.dart';

class LogInButton extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LogInButton(
      {Key? key,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  State<LogInButton> createState() => _LogInButtonState();
}

class _LogInButtonState extends State<LogInButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (() async {
        Map<String, String> apiCall = <String, String>{
          'email': widget.emailController.text,
          'password': widget.passwordController.text,
        };

        Response response = await NetworkHelper.sendData(
            httpClient,
            Uri(
                scheme: 'https',
                host: 'solaris-web-server.herokuapp.com',
                path: 'sign_in'),
            apiCall);

        if (response.statusCode == 200) {
          String data = response.body;
          Map<String, dynamic> decodedData = jsonDecode(data);
          token = decodedData["accessToken"];
          User user = User.fromJson(decodedData["user"]);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DashboardScreen(user: user)));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid email or password'),
            ),
          );
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
