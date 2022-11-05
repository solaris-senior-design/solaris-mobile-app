import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/screens/sign_up_screen.dart';
import 'package:solaris_mobile_app/utils/constants.dart';
import 'package:solaris_mobile_app/widgets/input_text_field.dart';
import 'package:solaris_mobile_app/widgets/log_in_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                      bottom: MediaQuery.of(context).size.height * 0.15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Log In',
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
                              hintText: "Email",
                              controller: emailController,
                            ),
                            InputTextField(
                              hintText: "Password",
                              controller: passwordController,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                              ),
                              child: const Text(
                                'Forgot password?',
                                style: kLogInScreenForgotPasswordText,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.03,
                              ),
                              child: LogInButton(
                                emailController: emailController,
                                passwordController: passwordController,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      const TextSpan(
                        text: "Need to sign up? ",
                        style: kGetStartedTaglineTextStyle,
                      ),
                      TextSpan(
                        text: 'Create an account!',
                        style: kLogInScreenCreateAccountText,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignInScreen()));
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
