import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/widgets/change_password_button.dart';
import 'package:solaris_mobile_app/widgets/log_out_button.dart';
import '../models/user.dart';
import '../utils/constants.dart';

class ProfileInfo extends StatefulWidget {
  final User user;
  const ProfileInfo({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Icon(
          Icons.account_circle,
          size: 80,
          color: kThemePrimaryColor,
        ),
        Text(
          widget.user.fullName,
          style: kDashboardHeadingTextStyle,
        ),
        Text(
          widget.user.username,
          style: kUserProfileInfoText,
        ),
        Text(
          widget.user.email,
          style: kUserProfileInfoText,
        ),
        const SizedBox(
          height: 20,
        ),
        const ChangePasswordButton(),
        const SizedBox(
          height: 20,
        ),
        LogOutButton(user: widget.user),
      ],
    );
  }
}
