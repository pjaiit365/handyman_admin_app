// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../Services/read_data.dart';
import '../constants.dart';

class CustomerJobUploadItem extends StatelessWidget {
  final int index;
  const CustomerJobUploadItem({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: <Widget>[
        SlidableAction(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(9),
            bottomRight: Radius.circular(9),
          ),
          onPressed: (BuildContext context) {},
          backgroundColor: red,
          foregroundColor: white,
          icon: Icons.delete_rounded,
        ),
      ]),
      child: GestureDetector(
        onTap: () {
          customerJobUploadSelectedIndex = index;
        },
        child: Container(
          height: 115 * screenHeight,
          width: 360 * screenWidth,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.04),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 1)),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 30 * screenWidth, vertical: 12 * screenHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Job ID: ${allCustomerJobUpload[index].jobUploadId}',
                  style: TextStyle(
                    color: appointmentTimeColor,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 12 * screenHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 190 * screenWidth,
                      child: Text(
                        allCustomerJobUpload[index].serviceProvided,
                        style: TextStyle(
                            color: primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                    Spacer(),
                    Text(
                      allCustomerJobUpload[index].status,
                      style: TextStyle(
                          color: allCustomerJobUpload[index].status == 'Active'
                              ? primary
                              : red,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ],
                ),
                SizedBox(height: 10 * screenHeight),
                SizedBox(
                  width: 300 * screenWidth,
                  child: Text(
                    'Customer ID: ${allCustomerJobUpload[index].customerID}',
                    style: TextStyle(
                        color: appointmentTimeColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
