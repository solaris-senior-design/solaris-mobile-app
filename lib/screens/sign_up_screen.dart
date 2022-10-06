import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/screens/log_in_screen.dart';
import 'package:solaris_mobile_app/utils/constants.dart';
import 'package:solaris_mobile_app/widgets/input_text_field.dart';
import 'package:solaris_mobile_app/widgets/sign_up_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.15,
                      right: MediaQuery.of(context).size.width * 0.15,
                      top: MediaQuery.of(context).size.height * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.05,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sign Up',
                          style: kLogInScreenHeadingText,
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.width * 0.01,
                          ),
                          child: const Text(
                            'to start monitoring your solar panels',
                            style: kLogInScreenSubheadingText,
                          ),
                        ),
                        Column(
                          children: [
                            InputTextField(
                              hintText: "Full Name",
                              controller: fullNameController,
                            ),
                            InputTextField(
                              hintText: "Username",
                              controller: usernameController,
                            ),
                            InputTextField(
                              hintText: "Email",
                              controller: emailController,
                            ),
                            InputTextField(
                                hintText: "Password",
                                controller: passwordController),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.03,
                              ),
                              child: const SignUpButton(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      const TextSpan(
                        text: "Need to log in? ",
                        style: kGetStartedTaglineTextStyle,
                      ),
                      TextSpan(
                        text: 'Log in here!',
                        style: kLogInScreenCreateAccountText,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogInScreen()));
                          },
                      ),
                    ]),
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
