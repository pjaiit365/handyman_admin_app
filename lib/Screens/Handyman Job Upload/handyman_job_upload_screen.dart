import 'package:flutter/material.dart';

import '../../constants.dart';
import '../Handyman Job Upload/Components/body.dart';

class HandymanJobUploadScreen extends StatelessWidget {
  const HandymanJobUploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
