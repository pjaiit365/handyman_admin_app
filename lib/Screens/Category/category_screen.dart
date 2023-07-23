import 'package:flutter/material.dart';

import '../../constants.dart';
import '../Category/Components/body.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Categories',
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
