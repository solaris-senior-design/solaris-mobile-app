import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../globals/globals.dart';
import '../models/network_helper.dart';
import '../models/user.dart';
import '../utils/constants.dart';

class ConfirmButton extends StatefulWidget {
  final User user;
  final TextEditingController oldPassword;
  final TextEditingController newPassword;
  final TextEditingController newPasswordConfirm;
  const ConfirmButton(
      {Key? key,
      required this.oldPassword,
      required this.newPassword,
      required this.newPasswordConfirm,
      required this.user})
      : super(key: key);

  @override
  State<ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
  bool validateText() {
    if (widget.newPassword.text == "" || widget.newPasswordConfirm.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill out all fields'),
        ),
      );
      return false;
    } else if (widget.newPassword.text != widget.newPasswordConfirm.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
        ),
      );
      return false;
    } else if (widget.newPassword.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 8 characters'),
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (() async {
        if (!validateText()) {
          return;
        }
        Map<String, String> apiCall = <String, String>{
          'newPassword': widget.newPassword.text,
        };

        Response response = await NetworkHelper.putData(
            httpClient,
            Uri(
                scheme: 'https',
                host: 'solaris-web-server.herokuapp.com',
                path: 'users/update_password/${widget.user.id}'),
            apiCall);

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successfully changed password'),
            ),
          );
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error changing password'),
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
        "CONFIRM",
        style: kGetStartedButtonText,
      ),
    );
  }
}
