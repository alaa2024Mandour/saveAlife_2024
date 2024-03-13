import 'package:flutter/material.dart';
import 'package:save_a_life_2024/shared/style/themes.dart';
import 'OnBording/on_bording.dart';



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
      home: Directionality( // use this
        textDirection: TextDirection.rtl, // set it to rtl //
        child: onBoardingScreen(),
      ),
    );
  }
}

