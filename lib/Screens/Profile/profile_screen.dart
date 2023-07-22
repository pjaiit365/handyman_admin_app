// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:handyman_admin_app/Components/bottom_nav_bar.dart';
import 'package:handyman_admin_app/enum.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(tabSelected: BottomNavState.profile),
    );
  }
}
