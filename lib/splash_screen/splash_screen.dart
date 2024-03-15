
import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';

import '../common_pages/stuff_user/stuff_user.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
        splash:Image(
          image: AssetImage("assets/images/icons/splash.png"),
        ),
        splashIconSize: 205,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: defultColor,
        nextScreen: StuffSAndUser());
  }
}
