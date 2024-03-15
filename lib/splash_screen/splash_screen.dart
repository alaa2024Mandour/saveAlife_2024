
import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save_a_life_2024/shared/components/shared_component.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';

import '../common_pages/stuff_user/stuff_user.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash:Image(
          image: AssetImage("assets/images/icons/splash.png"),
        ),
        splashIconSize: 205,
        splashTransition: SplashTransition.scaleTransition,
// backgroundColor: Colors.white,
        nextScreen: StuffSAndUser());
  }
}

// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
//
//   Future.delayed(
//       const Duration(seconds:  2) ,
//           (){
//         navegateAndFinish(context, StuffSAndUser());
//       }
//   );
// }
//
// @override
// void dispose() {
//   // TODO: implement dispose
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
//   super.dispose();
// }
//
// Container(
// width: double.infinity,
// decoration: BoxDecoration(
// gradient: LinearGradient(
// colors: [defultColor,Colors.white],
// begin: Alignment.topRight,
// end: Alignment.bottomLeft,
// )
// ),
// child: Center(
// child: Image(
// image: AssetImage("assets/images/icons/splash.png"),
// width: 200,
// height: 205,
// ),
// ),
// )