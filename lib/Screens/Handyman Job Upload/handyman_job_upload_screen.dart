import 'package:flutter/material.dart';
import 'package:handyman_admin_app/Components/default_back_button.dart';

import '../../constants.dart';
import '../Handyman Job Upload/Components/body.dart';

class HandymanJobUploadScreen extends StatelessWidget {
  const HandymanJobUploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Handyman Job Upload',
          style: TextStyle(
            color: primary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0.0,
        backgroundColor: white,
      ),
      body: Body(),
      backgroundColor: white,
    );
  }
}
