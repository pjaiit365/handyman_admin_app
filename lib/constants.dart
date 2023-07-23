// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:handyman_admin_app/Screens/Handyman%20Job%20Upload/handyman_job_upload_screen.dart';
import 'package:handyman_admin_app/Screens/Users/users_screen.dart';

import 'Screens/Category/category_screen.dart';
import 'Screens/Customer Job Upload/customer_job_upload_screen.dart';

late double width;
late double height;

Color white = Color(0xffffffff);
Color primary = const Color(0xff32B5BD);
Color tabLight = Color(0xffFAFAFA);
Color red = Color(0xffF53939);
Color green = Color(0xff1EDB53);
Color black = Color(0xff000000);
Color yellow = Color(0xffFFC10A);
Color pink = Color(0xffFF7B92);
Color sectionColor = Color(0xffF5F7F9);
Color grey = Color(0xffD9D9D9);
Color chatBlue = Color(0xff0076F7);
Color chatRed = Color(0xffFF1AA3);
Color chatGrey = Color(0xffF2F4F5);
Color textGreyColor = Color(0xff9BA1A9);
Color chatTimeColor = Color(0xffA7A4A4);
Color appointmentTimeColor = Color(0xffA7A5A5);
Color dividerColor = Color(0xff929292);
Color ratingTextColor = Color(0xff666060);
Color semiGrey = Color(0xff808080);
Color complementaryRed = Color(0xffBD3A32);

double screenWidth = width / 390;
double screenHeight = height / 844;

bool isRememberMeClicked = false;
bool loginTextFieldError = false;
bool forgotPasswordEmailError = false;

String loggedInUserId = '';

List<String> dashboardItemTitle = [
  'User',
  'Category',
  'Customer Job Upload',
  'Handyman Job Upload'
];
List<IconData> dashboardItemIcon = [
  Icons.person_outline_rounded,
  Icons.category_rounded,
  Icons.work_history_rounded,
  Icons.handyman_rounded,
];
List<Widget> dashboardItemScreen = [
  UsersScreen(),
  CategoryScreen(),
  CustomerJobUploadScreen(),
  HandymanJobUploadScreen(),
];

int handymanJobUploadSelectedIndex = 0;
int customerJobUploadSelectedIndex = 0;
int userSelectedIndex = 0;
int categorySelectedIndex = 0;
