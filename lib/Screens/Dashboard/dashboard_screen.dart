// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:handyman_admin_app/Components/bottom_nav_bar.dart';
import 'package:handyman_admin_app/Screens/Dashboard/Components/body.dart';
import 'package:handyman_admin_app/constants.dart';
import 'package:handyman_admin_app/enum.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: white,
      ),
      body: Body(),
      backgroundColor: white,
      bottomNavigationBar: BottomNavBar(tabSelected: BottomNavState.dashboard),
    );
  }
}
