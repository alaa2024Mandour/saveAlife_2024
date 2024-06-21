import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_a_life_2024/shared/network/core/API/dio_consumer.dart';
import 'package:save_a_life_2024/user_layouts/Login_page/signup%20form.dart';
import 'package:save_a_life_2024/user_layouts/user_cubit/userCubit.dart';
import '../../shared/components/shared_component.dart';
import '../../shared/style/colors.dart';
import '../user_cubit/userStatus.dart';
import 'forgetPass/forget_password.dart';


var formKey = GlobalKey<FormState>();

var loginEmailController = TextEditingController();
var loginPassController = TextEditingController();

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserStatus>(
        listener: (BuildContext context, UserStatus state) {
          if (state is sucssesSignIn){
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:Text("تم تسجيل الدخول  بنجاح ")));
          }else if (state is errorSignIn){
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:Text("هناك خطأ في تسجيل الدخول   ")));
          }
        },
        builder: (BuildContext context, UserStatus state) {
          var cubit = UserCubit.get(context);
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(statusBarColor:Colors.transparent,),
            child: Scaffold(
              backgroundColor: defultColor,
              body: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 40.0, bottom: 30),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: Image(image: AssetImage(
                              'assets/images/icons/splash.png'),
                          ),
                        ),
                      ),
                      const Text(
                          "اهلا بك ..",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700
                          )
                      ),
                      Column(
                        children: [
                          Form(
                            key: formKey,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                const Image(image: AssetImage('assets/images/cerves pages/LOG IN APP USER.png'),),
                                Positioned(
                                  top: 50,
                                  left: 20,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "تسجيل الدخول",
                                        style:  TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                      const SizedBox(height:3,),
                                      Container(
                                        width: 100,
                                        height: 3,
                                        color: defultColor,
                                      )
                                    ],
                                  ),
                                ),
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        height: 280,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40.0),
                                              bottomRight: Radius.circular(40.0),
                                              topLeft: Radius.circular(40.0),
                                              bottomLeft: Radius.circular(40.0)),
                                          // color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(25.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                defaultTextFormField(
                                                    controller: loginEmailController,
                                                    type: TextInputType.emailAddress,
                                                    hintText: 'البريد الالكتروني',
                                                    labelText: 'البريد الالكتروني',
                                                    preFix: Icons.email),

                                                const SizedBox(height: 10,),
                                                defaultTextFormField(
                                                  controller: loginPassController,
                                                  type: TextInputType.visiblePassword,
                                                  hintText: 'كلمه السر',
                                                  labelText: 'كلمه السر',
                                                  preFix: Icons.lock_outline,
                                                  isPassword: cubit.isPassword,
                                                  suFix:  cubit.suffixIcon,
                                                  suffixOnPressed: (){
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ConditionalBuilder(
                                      condition: state is! loadingSignIn,
                                      builder: (BuildContext context) {
                                        return defaultButton(
                                            text: "تسجيل الدخول",
                                            width: 140,
                                            radius: 35,
                                            function: (){
                                               if(formKey.currentState!.validate()) {
                                                   print(loginPassController.text);
                                                   print(loginEmailController.text);
                                                   cubit.signIn(
                                                       loginEmailController.text,
                                                       loginPassController.text,
                                                     context
                                                   );
                                                   if(cubit.user?.error != null){
                                                   return AwesomeDialog(
                                                       context: context,
                                                       animType: AnimType.scale,
                                                       dialogType: DialogType.info,
                                                       body: Center(child: Text(
                                                         'هناك خطا في البيانات المدخله',
                                                         style: TextStyle(fontStyle: FontStyle.italic),
                                                       ),),
                                                       title: 'ملحوظه ',
                                                       btnOkOnPress: () {},
                                                       btnOkColor: defultColor,
                                                       dialogBackgroundColor: Colors.white
                                                   )..show();
                                                 }
                                               }
                                               }
                                            , color: defultColor
                                        );

                                      },
                                      fallback: (BuildContext context) {
                                        return Center(child: CircularProgressIndicator());
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: defaultImageButton(
                                          image: "assets/images/icons/icons8-facebook-96.png",
                                          text: "تسجيل الدخول بفيسبوك",
                                          function: (){}),
                                    ),
                                    const SizedBox(width: 30,),
                                    Expanded(
                                      child: defaultImageButton(
                                          image: "assets/images/icons/icons8-google-96.png",
                                          text: "تسجيل الدخول بجوجل",
                                          function: (){}),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "ليس حساب  ...؟" ,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white),
                                    ),

                                    defaultTextButton(
                                        fontSize: 10,
                                        color: Colors.orangeAccent,
                                        function: (){
                                          navigateTo(context,  SignUpForm());
                                        },
                                        buttonlable: "انشاء حساب"),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           // Email Field
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             child: TextFormField(
    //               decoration: const InputDecoration(
    //                 hintText: 'البريد الالكتروني',
    //                 filled: true,
    //                 fillColor: Colors.transparent,
    //                 border: InputBorder.none,
    //               ),
    //             ),
    //           ),
    //           const SizedBox(height: 20),
    //           // Space between email and password fields
    //           // Password Field
    //           Divider(
    //             thickness: 1,
    //             endIndent: MediaQuery.of(context).size.width * 0.06,
    //             indent: MediaQuery.of(context).size.width * 0.06,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             child: TextFormField(
    //               decoration: const InputDecoration(
    //                 hintText: 'كلمة المرور',
    //                 filled: true,
    //                 fillColor: Colors.transparent,
    //                 border: InputBorder.none,
    //               ),
    //               obscureText: true,
    //             ),
    //           ),
    //           SizedBox(
    //             height: MediaQuery.of(context).size.height * 0.02,
    //           ),
    //           // Forgot Password Text
    //           TextButton(
    //             onPressed: () {
    //               // Implement forgot password logic here
    //             },
    //             child: const Text(
    //               'هل نسيت كلمة المرور؟',
    //               style: TextStyle(
    //                 color: Colors.red,
    //                 fontFamily: 'Lemonada',
    //                 fontSize: 10,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //
    //       // Login Button
    //       Positioned(
    //         bottom: MediaQuery.of(context).size.height * 0.001,
    //         child: ElevatedButton(
    //           onPressed: () {
    //             // Implement your login logic here
    //           },
    //           style: ElevatedButton.styleFrom(
    //             foregroundColor: Colors.white,
    //             backgroundColor: Colors.red,
    //             padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //           ),
    //           child: const Text(
    //             'تسجيل الدخول',
    //             style: TextStyle(fontSize: 10, fontFamily: 'Lemonada'),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
