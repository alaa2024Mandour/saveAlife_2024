import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import 'package:save_a_life_2024/user_layouts/user_cubit/userCubit.dart';

/*=================================================*/
//Reusable Buttons
/*=================================================*/
Widget defaultTextButton({
  required Function function,
  required String buttonlable,
  Color color = Colors.white,
  double fontSize = 20.0,
}) =>
    TextButton(
        onPressed: () {
          function();
        },
        child: Text(
          "$buttonlable",
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ));

Widget defaultButton({
  double width = double.infinity,
  double radius = 10.0,
  Color textColor = Colors.white,
  double fontSize = 11,
  required Color color ,
  required String text,
  required Function function,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );


Widget borderButton({
  required String text,
  required Function function,
}) =>
    OutlinedButton(
      style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(
              color: Colors.white,
              width: 1.0,
              style: BorderStyle.solid))),
      onPressed: () {
        function();
      },
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
          ),
        ),
    );

Widget defaultImageButton({
  double width = double.infinity,
  double radius = 10.0,
  Color buttonColor = Colors.white,
  Color TextColor = Colors.black,
  required String image,
  required String text,
  required Function function,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Row(
          children: [
            Image(
              image: AssetImage(image),
              width: 28,
              height: 33,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                text.toUpperCase(),
                style: TextStyle(
                  color: TextColor,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );

/*=================================================*/
//Reusable Text Form Field
/*=================================================*/
Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onTap,
  required String hintText,
  required String labelText,
  required IconData preFix,
//=======for Password=========
  IconData? suFix,
  Function? suffixOnPressed,
  bool isPassword = false,
}) =>
    TextFormField(

      controller: controller,
      keyboardType: type,
      obscureText: isPassword,

      //=======for Password=========
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },

      onTap: () {
        onTap!();
      },
      validator: (value) {
        if (value == null || value.isEmpty) return 'لابد من ملئ هذا الحقل';
        return null;
      },

      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 12, color: Colors.grey, ),
        prefixIcon: Icon(
          preFix,
          color: defultColor,
        ),
        suffix: suFix != null
            ? IconButton(
                onPressed: () {
                  suffixOnPressed!();
                },
                icon: Icon(
                  suFix,
                  color: defultColor,
                ),
              )
            : null,
        //=======for Password=========
        fillColor: Colors.transparent,
      ),
      style: TextStyle(
        fontSize: 15,
        fontFamily: 'Tajawal',
      ),

    );

//====================== Navigation =========================
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navegateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);
