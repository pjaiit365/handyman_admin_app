// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handyman_admin_app/wrapper.dart';

import '../../../Components/credentials_button.dart';
import '../../../Components/credentials_container.dart';
import '../../../constants.dart';
import '../../Forgot Password/forgot_password_screen.dart';
import '../../Dashboard/dashboard_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signIn() async {
    try {
      if (_emailController.text.trim() == 'admin@admin.com') {
        final user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        )
            .catchError((err) {
          print(err.toString());
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Center(
                  child: Text(
                    'Wrong Password',
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                content: Text(
                  err.toString(),
                  style: TextStyle(
                    height: 1.4,
                    color: black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
          );
        });

        loggedInUserId = FirebaseAuth.instance.currentUser!.uid;

        if (user.user!.email == 'admin@admin.com') {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                insetPadding:
                    EdgeInsets.symmetric(horizontal: 150 * screenWidth),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    (Platform.isIOS)
                        ? const CupertinoActivityIndicator(
                            radius: 20,
                            color: Color(0xff32B5BD),
                          )
                        : const CircularProgressIndicator(
                            color: Color(0xff32B5BD),
                          ),
                  ],
                ),
              );
            },
          );

          await Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Wrapper(),
              ),
            );
          });
        }
      } else {
        setState(() {
          loginTextFieldError = true;
        });
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: Text(
                  'Wrong credentials',
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              content: Text(
                'Enter admin credentials',
                style: TextStyle(
                  height: 1.4,
                  color: black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                e.code,
                style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            content: Text(
              e.message.toString(),
              style: TextStyle(
                color: black,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        },
      );
    } catch (err) {
      print(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 19.5,
            vertical: 35 * screenHeight,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 65 * screenHeight),
              Padding(
                padding: EdgeInsets.only(left: 5.5 * screenWidth),
                child: Text(
                  'Welcome Back! 👋',
                  style: TextStyle(
                    color: black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 6.5 * screenWidth,
                    top: 30 * screenHeight,
                    bottom: 54 * screenHeight),
                child: Text(
                  "Login with administrator credentials to access admin functionalities.\n\n Thank You.",
                  style: TextStyle(
                    color: semiGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
              ),
              CredentialsContainer(
                inputFormatter: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]')),

                  LengthLimitingTextInputFormatter(
                      30) // Deny specific characters
                ],
                errorTextField: loginTextFieldError,
                controller: _emailController,
                title: 'Email Address',
                hintText: 'Enter email address',
                isPassword: false,
                keyboardType: TextInputType.emailAddress,
                isPasswordVisible: false,
              ),
              SizedBox(height: 20 * screenHeight),
              CredentialsContainer(
                inputFormatter: [
                  LengthLimitingTextInputFormatter(
                      40) // Deny specific characters
                ],
                errorTextField: loginTextFieldError,
                controller: _passwordController,
                title: 'Password',
                hintText: 'Enter password',
                isPassword: true,
                isPasswordVisible: true,
              ),
              loginTextFieldError
                  ? SizedBox(height: 20 * screenHeight)
                  : SizedBox(),
              loginTextFieldError
                  ? Center(
                      child: Text(
                        'Incorrect email or password. Try again.',
                        style: TextStyle(
                          color: complementaryRed,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : SizedBox(),
              SizedBox(height: 30 * screenHeight),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRememberMeClicked = !isRememberMeClicked;
                        });
                      },
                      child: Container(
                        height: 20 * screenHeight,
                        width: 20 * screenWidth,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(2),
                          border:
                              Border.all(color: appointmentTimeColor, width: 1),
                        ),
                        alignment: Alignment.center,
                        child: isRememberMeClicked
                            ? Container(
                                height: 16 * screenHeight,
                                width: 16 * screenWidth,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  // borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 16,
                                )),
                              )
                            : SizedBox(),
                      ),
                    ),
                    SizedBox(width: 12 * screenWidth),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 2.0),
                      child: Text(
                        'Remember Me',
                        style: TextStyle(
                          height: 1.2,
                          color: black,
                          fontSize: 15,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: complementaryRed,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 60 * screenHeight),
              CredentialsButton(
                screen: signIn,
              ),
              SizedBox(height: 30 * screenHeight),
            ],
          ),
        ),
      ),
    );
  }
}
