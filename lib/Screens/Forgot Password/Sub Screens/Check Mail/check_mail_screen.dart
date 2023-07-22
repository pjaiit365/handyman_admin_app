import 'package:flutter/material.dart';
import '../../../../Components/default_back_button.dart';
import '../../../../constants.dart';
import '../../../Forgot Password/Sub Screens/Check Mail/Components/body.dart';

class CheckMailScreen extends StatelessWidget {
  const CheckMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(),
        backgroundColor: white,
        elevation: 0.0,
      ),
      body: Body(),
      backgroundColor: white,
    );
  }
}
