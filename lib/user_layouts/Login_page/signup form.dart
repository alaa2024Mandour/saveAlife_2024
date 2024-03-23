import 'package:flutter/material.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import 'package:save_a_life_2024/user_layouts/home_page/home_page.dart';

import '../../shared/components/shared_component.dart';
import '../OnBording/on_bording.dart';

class SignUpForm extends StatelessWidget {
   SignUpForm({super.key});
 var emailController = TextEditingController();
 var PassController = TextEditingController();
 var rePassController = TextEditingController();
 var fName = TextEditingController();
 var lName = TextEditingController();
 var phone = TextEditingController();
 var birthDay = TextEditingController();
 var address = TextEditingController();
 var gender = TextEditingController();
 var bloodType = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: defultColor,
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 50),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Image(image: AssetImage('assets/images/icons/splash.png'),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                        topLeft: Radius.circular(140.0),
                        bottomLeft: Radius.circular(40.0)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          defaultTextFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              hintText: 'البريد الالكتروني',
                              labelText: 'البريد الالكتروني',
                              preFix: Icons.email),
                          SizedBox(height: 10,),
                          defaultTextFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              hintText: 'البريد الالكتروني',
                              labelText: 'البريد الالكتروني',
                              preFix: Icons.email),
                          SizedBox(height: 10,),
                          defaultTextFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              hintText: 'البريد الالكتروني',
                              labelText: 'البريد الالكتروني',
                              preFix: Icons.email),
                          SizedBox(height: 10,),
                      ElevatedButton(
                                onPressed: () {
                                  navigateTo(context, onBoardingScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'تسجيل الدخول',
                                  style: TextStyle(
                                      fontSize: 10, fontFamily: 'Lemonada'),
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),

      ),
    );

    // return  Stack(
    //
    //   children: [
    //
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Row(
    //           children: [
    //             Flexible(
    //               flex: 2,
    //               // Wrap with Flexible
    //               child: Text(
    //                 'تسجيل الدخول',
    //                 style: TextStyle(
    //                   fontFamily: 'Lemonada',
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 12,
    //                 ),
    //                 textAlign: TextAlign.end,
    //               ),
    //             ),
    //             Flexible(
    //               flex: 4,
    //               // Wrap with Flexible
    //               fit: FlexFit.tight,
    //               child: Text(
    //                 'ليس لديك جساب؟',
    //                 style: TextStyle(
    //                   fontFamily: 'Lemonada',
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 12,
    //                 ),
    //                 textAlign: TextAlign.end,
    //               ),
    //             ),
    //           ],
    //         ),
    //         // Email Field
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 20),
    //           child: TextFormField(
    //             decoration: const InputDecoration(
    //               hintText: 'البريد الالكتروني',
    //               filled: true,
    //               fillColor: Colors.transparent,
    //               border: InputBorder.none,
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         // Space between email and password fields
    //         // Password Field
    //         Divider(
    //           thickness: 1,
    //           endIndent: MediaQuery.of(context).size.width * 0.06,
    //           indent: MediaQuery.of(context).size.width * 0.06,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 20),
    //           child: TextFormField(
    //             decoration: const InputDecoration(
    //               hintText: 'كلمة المرور',
    //               filled: true,
    //               fillColor: Colors.transparent,
    //               border: InputBorder.none,
    //             ),
    //             obscureText: true,
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 20),
    //           child: TextFormField(
    //             decoration: const InputDecoration(
    //               hintText: 'كلمة المرور',
    //               filled: true,
    //               fillColor: Colors.transparent,
    //               border: InputBorder.none,
    //             ),
    //             obscureText: true,
    //           ),
    //         ),
    //         SizedBox(
    //           height: MediaQuery.of(context).size.height * 0.02,
    //         ),
    //         // Forgot Password Text
    //         TextButton(
    //           onPressed: () {
    //             // Implement forgot password logic here
    //           },
    //           child: const Text(
    //             'هل نسيت كلمة المرور؟',
    //             style: TextStyle(
    //               color: Colors.red,
    //               fontFamily: 'Lemonada',
    //               fontSize: 10,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //
    //     // Login Button
    //     Positioned(
    //       bottom: MediaQuery.of(context).size.height * 0.001,
    //       child: ElevatedButton(
    //         onPressed: () {
    //           // Implement your login logic here
    //         },
    //         style: ElevatedButton.styleFrom(
    //           foregroundColor: Colors.white,
    //           backgroundColor: Colors.red,
    //           padding: const EdgeInsets.symmetric(
    //               horizontal: 40, vertical: 15),
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(10),
    //           ),
    //         ),
    //         child: const Text(
    //           'تسجيل الدخول',
    //           style: TextStyle(
    //               fontSize: 10, fontFamily: 'Lemonada'),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
