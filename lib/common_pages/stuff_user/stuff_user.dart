import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_a_life_2024/shared/components/shared_component.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import 'package:save_a_life_2024/user_layouts/OnBording/on_bording.dart';

class StuffSAndUser extends StatelessWidget {
  const StuffSAndUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              MaterialButton(

                onPressed: () {
                  navigateTo(context, onBoardingScreen());
                },
                child: Text(
                  "user".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                color: defultColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
