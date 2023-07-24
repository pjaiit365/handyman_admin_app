import 'package:flutter/material.dart';
import 'package:handyman_admin_app/constants.dart';
import 'package:lottie/lottie.dart';

class DashboardItem extends StatelessWidget {
  final String title;
  final String icon;
  final Widget screen;

  const DashboardItem({
    super.key,
    required this.title,
    required this.icon,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
      child: Container(
        height: 225 * screenHeight,
        width: 170 * screenWidth,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
                color: primary.withOpacity(0.08),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 1)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Lottie.asset(icon, height: 55, width: 55),
              SizedBox(height: 5 * screenHeight),
              Text(
                title,
                style: TextStyle(
                    color: primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 1.4),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
