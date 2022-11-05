import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:solaris_mobile_app/utils/constants.dart';
import '../globals/globals.dart';
import '../models/network_helper.dart';
import '../models/user.dart';
import '../screens/dashboard_screen.dart';

class SignUpButton extends StatefulWidget {
  final TextEditingController fullNameController;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const SignUpButton(
      {Key? key,
      required this.fullNameController,
      required this.usernameController,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (() async {
        Map<String, String> apiCall = <String, String>{
          'fullName': widget.fullNameController.text,
          'username': widget.usernameController.text,
          'email': widget.emailController.text,
          'password': widget.passwordController.text,
        };

        Response response = await NetworkHelper.sendData(
            httpClient,
            Uri(
                scheme: 'https',
                host: 'solaris-web-server.herokuapp.com',
                path: 'sign_up'),
            apiCall);

        if (response.statusCode == 200) {
          String data = response.body;
          Map<String, dynamic> decodedData = jsonDecode(data);
          User user = User.fromJson(decodedData);
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
        "SIGN UP",
        style: kGetStartedButtonText,
      ),
    );
  }
}
