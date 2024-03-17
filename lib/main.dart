import 'package:flutter/material.dart';
import 'package:save_a_life_2024/shared/style/themes.dart';
import 'package:save_a_life_2024/splash_screen/splash_screen.dart';
import 'package:save_a_life_2024/user_layouts/OnBording/on_bording.dart';
import 'package:save_a_life_2024/user_layouts/home_page/home_page.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme ,
      home: SplashScreen(),
    );
  }
}

