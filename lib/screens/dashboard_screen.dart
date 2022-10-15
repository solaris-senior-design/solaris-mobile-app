import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/widgets/metric_card_section.dart';
import 'package:solaris_mobile_app/widgets/metric_line_chart_section.dart';
import 'package:solaris_mobile_app/widgets/power_bar_chart_section.dart';
import 'package:solaris_mobile_app/widgets/profile_info.dart';
import '../models/user.dart';
import '../utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  final User user;
  const DashboardScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  late List<Widget> widgetOptions = <Widget>[
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PowerBarChartSection(),
        MetricCardSection(),
        MetricLineChartSection(),
      ],
    ),
    const Text(
      'Export Screen',
      style: kDashboardLogoTextStyle,
    ),
    ProfileInfo(user: widget.user)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeOffWhiteColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kThemePrimaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ios_share),
            label: 'Export',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kThemePinkLineColor,
        unselectedItemColor: kThemeOffWhiteColor,
        onTap: _onItemTapped,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Column(children: [
                const Center(
                  child: Text(
                    'solaris',
                    style: kDashboardLogoTextStyle,
                  ),
                ),
                widgetOptions.elementAt(_selectedIndex)
              ]),
            )
          ],
        ),
      ),
    );
  }
}
