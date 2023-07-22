import 'package:flutter/material.dart';
import '../../Components/default_back_button.dart';
import '../../constants.dart';
import '../Forgot Password/Components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: DefaultBackButton(),
        elevation: 0.0,
      ),
      body: Body(),
      backgroundColor: white,
    );
  }
}
