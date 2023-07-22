import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../Services/read_data.dart';
import '../constants.dart';

class UserItem extends StatelessWidget {
  final int index;
  const UserItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    ReadData readData = ReadData();
    void deleteUser(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              title: Center(
                child: Text(
                  'Delete User',
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Are you sure you want to delete this user? ',
                    style: TextStyle(
                      height: 1.4,
                      color: black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 18 * screenHeight),
                  Text(
                    'User: ${allUsers[index].email}',
                    style: TextStyle(
                      height: 1.4,
                      color: red,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 50 * screenHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        highlightColor: grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Ink(
                          height: 39 * screenHeight,
                          width: 129 * screenWidth,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 12.0),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: appointmentTimeColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: semiGrey,
                        width: 10,
                        thickness: 10,
                      ),
                      InkWell(
                        highlightColor: red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          readData.delete(index);
                          setState(() {
                            Navigator.pop(
                              context,
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.black45,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                content: const Center(
                                  child: Text(
                                    'User successfully deleted!',
                                  ),
                                ),
                              )),
                            );
                          });
                        },
                        child: Ink(
                          height: 39 * screenHeight,
                          width: 129 * screenWidth,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text('Yes, Delete',
                                style: TextStyle(
                                  color: red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: <Widget>[
        SlidableAction(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(9),
            bottomRight: Radius.circular(9),
          ),
          onPressed: deleteUser,
          backgroundColor: red,
          foregroundColor: white,
          icon: Icons.delete_rounded,
        ),
      ]),
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
                'User ID: ${allUsers[index].id}',
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 260 * screenWidth,
                        child: Text(
                          allUsers[index].email,
                          style: TextStyle(
                              color: primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 10 * screenHeight),
                      SizedBox(
                        width: 260 * screenWidth,
                        child: Text(
                          '${allUsers[index].firstName} ${allUsers[index].lastName}',
                          style: TextStyle(
                              color: appointmentTimeColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    allUsers[index].role == 'Regular Customer'
                        ? Icons.work_history_rounded
                        : Icons.handyman_rounded,
                    color: primary,
                    size: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
