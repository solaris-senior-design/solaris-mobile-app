import 'package:flutter/material.dart';

import '../models/user.dart';
import '../utils/constants.dart';
import '../widgets/confirm_change_password_button.dart';
import '../widgets/input_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  final User user;
  const ChangePasswordScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController newPasswordConfirm = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    oldPassword.dispose();
    newPassword.dispose();
    newPasswordConfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeOffWhiteColor,
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'solaris',
                          style: kDashboardLogoTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.15,
                      right: MediaQuery.of(context).size.width * 0.15,
                      top: MediaQuery.of(context).size.height * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hey ${widget.user.fullName.split(' ')[0]},',
                          style: kLogInScreenHeadingText,
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.width * 0.01,
                          ),
                          child: const Text(
                            'change your password using the fields below',
                            style: kLogInScreenSubheadingText,
                          ),
                        ),
                        Column(
                          children: [
                            InputTextField(
                              hintText: "Old Password",
                              controller: oldPassword,
                            ),
                            InputTextField(
                              hintText: "New Password",
                              controller: newPassword,
                            ),
                            InputTextField(
                              hintText: "Confirm New Password",
                              controller: newPasswordConfirm,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.03,
                              ),
                              child: ConfirmButton(
                                oldPassword: oldPassword,
                                newPassword: newPassword,
                                newPasswordConfirm: newPasswordConfirm,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
