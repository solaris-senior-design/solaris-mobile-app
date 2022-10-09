import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/widgets/change_password_button.dart';
import 'package:solaris_mobile_app/widgets/log_out_button.dart';

import '../utils/constants.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 20,
        ),
        Icon(
          Icons.account_circle,
          size: 80,
          color: kThemePrimaryColor,
        ),
        Text(
          'Jaime Garcia, Jr.',
          style: kDashboardHeadingTextStyle,
        ),
        Text(
          'jaimegarjr',
          style: kUserProfileInfoText,
        ),
        Text(
          'jjgarcia2725@gmail.com',
          style: kUserProfileInfoText,
        ),
        SizedBox(
          height: 20,
        ),
        ChangePasswordButton(),
        SizedBox(
          height: 20,
        ),
        LogOutButton(),
      ],
    );
  }
}
