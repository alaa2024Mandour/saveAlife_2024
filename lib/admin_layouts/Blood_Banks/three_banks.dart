import 'package:flutter/material.dart';

class ThreeBanks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 89,
          height: 22,
          child: Text(
            'ELShatby',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFF0606),
              fontSize: 15,
              fontFamily: 'Noto Serif Kannada',
              fontWeight: FontWeight.w600,
              height: 0.09,
              letterSpacing: 0.75,
            ),
          ),
        ),
        SizedBox(
          width: 102,
          height: 27,
          child: Text(
            'Kom el deka',
            style: TextStyle(
              color: Color(0xFFC7C7C7),
              fontSize: 15,
              fontFamily: 'Noto Serif Kannada',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ),
        SizedBox(
          width: 147,
          height: 27,
          child: Text(
            'El helal_el ahmer',
            style: TextStyle(
              color: Color(0xFFC7C7C7),
              fontSize: 15,
              fontFamily: 'Noto Serif Kannada',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ),
        Container(
          width: 159,
          height: 15,
          decoration: ShapeDecoration(
            color: Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Color(0xFFC4C4C4),
              ),
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
        Container(
          width: 156,
          height: 15,
          decoration: ShapeDecoration(
            color: Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Color(0xFFAEAEAE),
              ),
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
        Container(
          width: 89,
          height: 16,
          decoration: ShapeDecoration(
            color: Color(0xFFF61C18),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFF61C18)),
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
      ],
    );
  }
}