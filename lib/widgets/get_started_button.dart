import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/models/metrics_model.dart';
import 'package:solaris_mobile_app/screens/dashboard_screen.dart';
import 'package:solaris_mobile_app/utils/constants.dart';
import 'package:solaris_mobile_app/utils/get_local_json.dart';

import '../models/network_helper.dart';

class GetStartedButton extends StatefulWidget {
  const GetStartedButton({Key? key}) : super(key: key);

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (() async {
        NetworkHelper networkHelper = NetworkHelper(
          Uri(
              scheme: 'https',
              host: 'solaris-web-server.herokuapp.com',
              path: 'record'),
        ); // 'https://solaris-web-server.herokuapp.com'
        // Map<String, dynamic> data = json.decode(await getLocalJson());
        Map<String, dynamic> data = await networkHelper.getData();
        MetricsModel metricsModel = MetricsModel.fromJson(data["data"][0]);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DashboardScreen(
                      metricsModel: metricsModel,
                    )));
      }),
      style: TextButton.styleFrom(
          elevation: 5.0,
          padding: const EdgeInsets.fromLTRB(55, 12, 55, 12),
          backgroundColor: kThemePrimaryColor,
          primary: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
      child: const Text(
        'GET STARTED',
        style: kGetStartedButtonText,
      ),
    );
  }
}
