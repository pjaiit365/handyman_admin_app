import 'package:flutter/material.dart';
import 'package:handyman_admin_app/Screens/Login/Components/body.dart';

import '../../constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      backgroundColor: white,
    );
  }
}
