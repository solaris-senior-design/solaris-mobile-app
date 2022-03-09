import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/screens/dashboard_screen.dart';
import 'package:solaris_mobile_app/utils/constants.dart';
import 'package:solaris_mobile_app/widgets/get_started_button.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeOffWhiteColor,
      body: ListView(
        children: [
          Text(
            'solaris',
            style: kGetStartedLogoTextStyle,
          ),
          Text(
            'the sun at the palm of your hands',
            style: kGetStartedTaglineTextStyle,
          ),
          Image.asset('assets/images/undraw_visual_data_re_mxxo 1.png'),
          Text(
            'Track solar panel power generation data instantly',
            style: kGetStartedDescriptionText,
          ),
          GetStartedButton(
            nextScreen: DashboardScreen(),
          )
        ],
      ),
    );
  }
}
