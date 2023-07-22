// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../Components/dashboard_item.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30 * screenHeight),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DashboardItem(
                title: dashboardItemTitle[0],
                icon: dashboardItemIcon[0],
                screen: dashboardItemScreen[0],
              ),
              DashboardItem(
                title: dashboardItemTitle[1],
                icon: dashboardItemIcon[1],
                screen: dashboardItemScreen[1],
              ),
            ],
          ),
          SizedBox(height: 30 * screenHeight),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DashboardItem(
                title: dashboardItemTitle[2],
                icon: dashboardItemIcon[2],
                screen: dashboardItemScreen[2],
              ),
              DashboardItem(
                title: dashboardItemTitle[3],
                icon: dashboardItemIcon[3],
                screen: dashboardItemScreen[3],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
