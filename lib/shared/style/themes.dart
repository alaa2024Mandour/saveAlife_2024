import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData lightTheme =ThemeData(
  primarySwatch: Colors.red,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ),
    titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w900,
        color: Colors.black
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 25,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defultColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defultColor,
    backgroundColor: Colors.white,
    elevation: 25.0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: Colors.black
    ),

  ),
  fontFamily: 'Lemonada',
);