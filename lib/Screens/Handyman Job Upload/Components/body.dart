import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handyman_admin_app/Components/category_item.dart';
import 'package:handyman_admin_app/Components/customer_job_upload_item.dart';
import 'package:handyman_admin_app/Components/handyman_job_upload_item.dart';
import 'package:handyman_admin_app/Services/read_data.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReadData readData = ReadData();
    return FutureBuilder(
        future: readData.getAllHandymanJobUploads(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 15.0,
                    vertical: 20 * screenHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return HandymanJobUploadItem(index: index);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 30 * screenHeight);
                        },
                        itemCount: allHandymanJobUpload.length),
                  ],
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Platform.isIOS
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return AlertDialog(
              title: Center(
                child: Text(
                  'Error',
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              content: Text(
                'There was an error when loading data from server. \n\nTry again later.',
                style: TextStyle(
                  height: 1.4,
                  color: black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }
          if (snapshot.hasData == false) {
            return AlertDialog(
              title: Center(
                child: Text(
                  'Error',
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              content: Text(
                'There was an error when loading data from server. \n\nTry again later.',
                style: TextStyle(
                  height: 1.4,
                  color: black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }
          return Center(
            child: Platform.isIOS
                ? CupertinoActivityIndicator()
                : CircularProgressIndicator(),
          );
        });
  }
}
