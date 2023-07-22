import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:handyman_admin_app/Screens/Splash/splash_continuation.dart';
import 'package:page_transition/page_transition.dart';
import '../../constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: 700,
        splash: Image.asset('assets/images/app_logo.png'),
        nextScreen: SplashContinuation(),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: white,
        pageTransitionType: PageTransitionType.fade,
        animationDuration: Duration(seconds: 2),
      ),
    );
  }
}
