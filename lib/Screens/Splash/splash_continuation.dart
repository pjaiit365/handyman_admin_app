import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:page_transition/page_transition.dart';

import '../../wrapper.dart';

class SplashContinuation extends StatelessWidget {
  const SplashContinuation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: 700,
        splash: Image.asset(
          'assets/images/app_logo.png',
          color: white,
        ),
        nextScreen: const Wrapper(),
        splashTransition: SplashTransition.rotationTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        duration: 3000,
        backgroundColor: primary,
      ),
    );
  }
}
