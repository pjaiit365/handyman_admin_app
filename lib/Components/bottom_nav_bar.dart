import 'package:flutter/material.dart';
import 'package:handyman_admin_app/Screens/Dashboard/dashboard_screen.dart';
import 'package:handyman_admin_app/Screens/Profile/profile_screen.dart';

import '../constants.dart';
import '../enum.dart';

class BottomNavBar extends StatelessWidget {
  final Enum tabSelected;
  const BottomNavBar({
    super.key,
    required this.tabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56 * screenHeight,
      width: double.infinity,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashboardScreen(),
                ),
              );
            },
            child: Container(
              height: 56 * screenHeight,
              width: 195 * screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color:
                    tabSelected == BottomNavState.dashboard ? primary : white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.dashboard_outlined,
                    color: tabSelected == BottomNavState.dashboard
                        ? white
                        : primary,
                  ),
                  SizedBox(width: 5 * screenWidth),
                  Text(
                    'Dashboard',
                    style: tabSelected == BottomNavState.dashboard
                        ? TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )
                        : TextStyle(
                            color: primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
            child: Container(
              height: 56 * screenHeight,
              width: 195 * screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: tabSelected == BottomNavState.profile ? primary : white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_pin,
                    color:
                        tabSelected == BottomNavState.profile ? white : primary,
                  ),
                  SizedBox(width: 5 * screenWidth),
                  Text(
                    'Profile',
                    style: tabSelected == BottomNavState.profile
                        ? TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )
                        : TextStyle(
                            color: primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
