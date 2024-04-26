import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common_pages/stuff_user/stuff_user.dart';
import '../../shared/components/shared_component.dart';
import '../../user_layouts/Login_page/forgetPass/forget_password.dart';
import '../../user_layouts/user_cubit/userCubit.dart';
import '../../user_layouts/user_cubit/userStatus.dart';
import '../admin_home_page/admin_home_page.dart';

var adminEmailController = TextEditingController();
var adminPassController = TextEditingController();
var formKey = GlobalKey<FormState>();

class AdminLogin extends StatelessWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<UserCubit,UserStatus>(
      listener: (BuildContext context, UserStatus state) {  },
    builder: (BuildContext context, UserStatus state) {
      var cubit = UserCubit.get(context);
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/images/cerves pages/DOTS APP.png"),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                          onPressed: () {
                            navigateTo(context, StuffSAndUser());
                          },
                          icon:
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.black,
                          )),
                    ),
                    Container(
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffa3b1c6), // darker color
                          ),
                          BoxShadow(
                            color: Color(0xffe0e5ec), // background color
                            spreadRadius: -2.0,
                            blurRadius: 12.0,
                          ),
                        ],
                      ),
                      child: Image(image: AssetImage(
                          'assets/images/icons/splash.png'),
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(height: 35,),
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              defaultTextFormField(
                                  controller: adminEmailController,
                                  type: TextInputType.emailAddress,
                                  hintText: 'البريد الالكتروني',
                                  labelText: 'البريد الالكتروني',
                                  preFix: Icons.email),
                              const SizedBox(height: 10,),
                              defaultTextFormField(
                                controller: adminPassController,
                                type: TextInputType.visiblePassword,
                                hintText: 'كلمه السر',
                                labelText: 'كلمه السر',
                                preFix: Icons.lock_outline,
                                isPassword: cubit.isPassword,
                                suFix: cubit.suffixIcon,
                                suffixOnPressed: () {
                                  cubit.changePasswordVisibility();
                                },
                              ),
                              const SizedBox(height: 10,),
                              TextButton(
                                onPressed: () {
                                  navigateTo(context, const ForgetScreen());
                                },
                                child: const Text(
                                  'هل نسيت كلمة المرور؟',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              defaultButton(
                                  text: "تسجيل الدخول",
                                  width: 140,
                                  radius: 35,
                                  function: (){
                                    if(formKey.currentState!.validate()) {
                                      navigateTo(context, AdminHome());
                                    }
                                  }
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    );

  }
}
