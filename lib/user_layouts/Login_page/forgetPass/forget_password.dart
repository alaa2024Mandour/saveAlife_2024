import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:save_a_life_2024/user_layouts/Login_page/forgetPass/verification.dart';
import '../../../shared/components/shared_component.dart';
import '../signup form.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            navigateTo(context, SignUpForm());
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.red,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: HexColor('#FFEAEA'),
                      borderRadius: BorderRadius.circular(100),
                      boxShadow:[
                        BoxShadow(
                          color: HexColor('#C4C4C4'),
                          blurRadius: 4.0,
                          spreadRadius: 2.0,
                        ),
                      ]
                    ),
                    width: 150,
                    height: 150,
                  ),
                 Image(
                   image: AssetImage("assets/images/icons/icons8-alzheimer-64.png"),
                   width: 110,
                   height:110 ,
                   fit: BoxFit.cover,
                 )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'هل نسيت كلمة السر ؟',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'أدخل رقم الهاتف الخاص بك لتلقي رسالة إعادة تعيين المرور الخاصة بك',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: HexColor("#ADADAD"),
                  fontSize: 14
                ),
              ),
              SizedBox(
                  height: 30),
              defaultTextFormField(
                controller: TextEditingController(),
                type: TextInputType.emailAddress,
                hintText: AutofillHints.email,
                labelText: 'أدخل بريدك الالكتروني',
                preFix: Icons.email_outlined,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  child: defaultButton(
                    text: 'أستعادة الرقم السرى',
                    function: ()
                    {
                      navigateTo(context, EnterCode());
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
