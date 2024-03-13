import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*=================================================*/
//Reusable Buttons
/*=================================================*/
Widget defaultTextButton ({
  required Function function,
  required String buttonlable,
  Color color = Colors.white,
  double fontSize = 20.0,
}) => TextButton(
    onPressed: (){
      function();
    },
    child: Text(
        "$buttonlable",
      style: TextStyle(
        color: color,
        fontSize:fontSize,
        fontWeight:FontWeight.w400,
      ),
    )
);

Widget defaultButton({
  Color backgroundColor = Colors.blue,
  double width = double.infinity,
  double radius = 10.0,
  required String text,
  required Function function,
}) => Container(
  width: width,
  decoration: BoxDecoration(
    color: backgroundColor,
    borderRadius: BorderRadius.circular(radius),
  ),
  child: MaterialButton(
    onPressed: () {
      function();
    },
    child: Text(
      text.toUpperCase(),
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
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
  Function? onChange,
  Function? OnTap,
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

      onChanged: (s) {
        onChange!(s);
      },

      onTap: () {
        OnTap!();
      },
      validator: (value) {
        if (value == null || value.isEmpty) return 'Field is required.';
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(preFix),
        suffix: suFix != null
            ? IconButton(
          onPressed: () {
            suffixOnPressed!();
          },
          icon: Icon(suFix),
        )
            : null,
        //=======for Password=========
        border: OutlineInputBorder(),
      ),
    );