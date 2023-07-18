import 'package:flutter/material.dart';
import 'package:handyman_admin_app/Screens/Splash/splash_screen.dart';

import 'constants.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initialiseApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handyman Admin Application',
      home: SplashScreen(),
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,

        datePickerTheme: DatePickerThemeData(
          headerBackgroundColor: primary,
        ),

        // timePickerTheme: TimePickerThemeData(),
        appBarTheme: AppBarTheme(
          color: white,
          elevation: 0.0,
        ),
        fontFamily: 'Inter',
        backgroundColor: white,
      ),
    );
  }
}
