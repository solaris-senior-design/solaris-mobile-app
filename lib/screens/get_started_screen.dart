import 'package:flutter/material.dart';
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
                          style: kGetStartedLogoTextStyle,
                        ),
                        Text(
                          'the sun at the palm of your hands',
                          style: kGetStartedTaglineTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03,
                      vertical: MediaQuery.of(context).size.height * 0.06,
                    ),
                    child: Image.asset(
                        'assets/images/undraw_visual_data_re_mxxo 1.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.15,
                      right: MediaQuery.of(context).size.width * 0.15,
                    ),
                    child: const Text(
                      'Track solar panel power generation data instantly',
                      style: kGetStartedDescriptionText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1),
                    child: const GetStartedButton(),
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
