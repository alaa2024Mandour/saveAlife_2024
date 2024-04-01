import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pinput.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import '../../../shared/components/shared_component.dart';
import 'forget_password.dart';

class EnterCode extends StatelessWidget {
  const EnterCode({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
          color: Colors.red.shade500,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.transparent)),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            navigateTo(context, ForgetScreen());
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.red,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(19),
                boxShadow: [
                  BoxShadow(
                    color: HexColor('#C4C4C4'),
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                  ),
                ]),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'أدخل الرمز المكون من ٤ خانات',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color:defultColor,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow:[
                              BoxShadow(
                                color: HexColor('#C4C4C4'),
                                blurRadius: 4.0,
                                spreadRadius: 2.0,
                              ),
                            ]
                        ),
                        width: 109,
                        height: 109,
                      ),
                      Image(
                        image: AssetImage("assets/images/icons/icons8-mailing-64 (1).png"),
                        width: 64,
                        height:64 ,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                  SizedBox(height: 35, ),
                  Container(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        length: 4,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: Colors.red),
                        )),
                        onCompleted: (pin) => debugPrint(pin),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'ألم تستطع الحصول على رمز التحقق؟',
                          style: TextStyle(
                            color: HexColor("#CDCDCD"),
                            fontSize: 9,
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'إعادة الإرسال',
                            style: TextStyle(
                              color: defultColor,
                              fontSize: 9,
                            ),
                          )),
                    ],
                  ),
                  defaultButton(text: 'تحقق', function: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
