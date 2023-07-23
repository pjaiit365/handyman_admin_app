import 'package:flutter/material.dart';

import '../../constants.dart';
import '../Customer Job Upload/Components/body.dart';

class CustomerJobUploadScreen extends StatelessWidget {
  const CustomerJobUploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Customer Job Upload',
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
