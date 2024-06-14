import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:save_a_life_2024/shared/components/localization/appLocal.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import '../../shared/components/shared_component.dart';
import '../user_cubit/userCubit.dart';
import '../user_cubit/userStatus.dart';

import 'login form.dart';

class SignUpForm extends StatelessWidget {
   SignUpForm({super.key});
   var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserStatus>(
        listener: (BuildContext context, UserStatus state) {
          if (state is sucssesSignIn){
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:Text("تم انشاء حساب بنجاح ")));
          }else if (state is errorSignIn){
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:Text("هناك خطأ في انشاء الحساب   ")));
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
                      child:Image(image: AssetImage(
                          'assets/images/icons/splash.png'),
                      ),
                    ),
                  ),
                  const Text(
                      "مرحبا, بك",
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
                             const Image(image: AssetImage('assets/images/cerves pages/SIGN UP APP USER.png'),),
                             Positioned(
                               top: 50,
                               right: 20,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   const Text(
                                     "إنشاء حساب",
                                     style: TextStyle(
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
                                     height: 320,
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
                                             Stack(
                                               alignment: Alignment.bottomRight,
                                               children:[
                                                 cubit.profilePicture == null?
                                                 const CircleAvatar(
                                                   radius: 64,
                                                   backgroundImage: AssetImage("assets/images/icons/avatar.png"),
                                                   backgroundColor: Colors.white,
                                                 )
                                                     :CircleAvatar(
                                                   radius: 64,
                                                   backgroundImage: FileImage(File(cubit.profilePicture!.path)),
                                                 ) ,
                                                 Positioned(
                                                   child: IconButton(
                                                     onPressed: () {
                                                       ImagePicker().pickImage(source: ImageSource.gallery)
                                                           .then((value) => cubit.uploadImage(value!));
                                                     },
                                                     icon: const Icon( Icons.add_a_photo , color: Colors.black,),),)
                                               ],
                                             ),
                                             defaultTextFormField(
                                                 controller: cubit.nameController,
                                                 type: TextInputType.name,
                                                 hintText: 'الاسم',
                                                 labelText: 'الاسم',
                                                 preFix: Icons.person),
                                             const SizedBox(height: 10,),
                                             defaultTextFormField(
                                                 controller: cubit.emailController,
                                                 type: TextInputType.emailAddress,
                                                 hintText: 'البريد الالكتروني',
                                                 labelText: 'البريد الالكتروني',
                                                 preFix: Icons.email),
                                             const SizedBox(height: 10,),
                                             defaultTextFormField(
                                               controller: cubit.passController,
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
                                             defaultTextFormField(
                                               controller: cubit.rePassController,
                                               type: TextInputType.visiblePassword,
                                               hintText: 'اعاده كلمه السر',
                                               labelText: 'اعاده كلمه السر',
                                               preFix: Icons.lock_outline,
                                               isPassword: cubit.isPassword,
                                             ),
                                             // defaultTextFormFieldOnTaped(
                                             //     controller: cubit.birthDayController,
                                             //     type: TextInputType.datetime,
                                             //     hintText: 'تاريخ الميلاد',
                                             //     labelText: 'تاريخ الميلاد',
                                             //     onTap: ( ) {
                                             //       showDatePicker(
                                             //           context: context,
                                             //           initialDate: DateTime.now(),
                                             //           firstDate: DateTime(1930),
                                             //           lastDate: DateTime.now(),
                                             //       ).then((value) {
                                             //         cubit.birthDayController.text=DateFormat.yMMMd().format(value!);
                                             //         print(DateFormat.yMMMd().format(value));
                                             //       });
                                             //     },
                                             //     preFix: Icons.date_range_rounded
                                             // ),
                                             defaultTextFormField(
                                                 controller: cubit.birthDayController,
                                                 type: TextInputType.datetime,
                                                 hintText: 'التاريخ',
                                                 labelText: 'التاريخ',
                                                 preFix: Icons.date_range_rounded),

                                             const SizedBox(height: 10,),
                                             defaultTextFormField(
                                                 controller: cubit.phoneController,
                                                 type: TextInputType.phone,
                                                 hintText: 'رقم الهاتف',
                                                 labelText: 'رقم الهاتف',
                                                 preFix: Icons.phone_android),
                                             const SizedBox(height: 10,),
                                             Row(
                                               children: [
                                                 Icon(Icons.location_on_outlined, color: defultColor,),
                                                 SizedBox(width: 12,),
                                                 Text('المدينه',
                                                   style: TextStyle(
                                                     fontSize: 10,
                                                     fontWeight: FontWeight.w900,
                                                     color: Colors.grey
                                                   ),
                                                 ),
                                                 SizedBox(width: 20,),
                                                 Expanded(
                                                   child: DropdownButtonHideUnderline(
                                                     child: DropdownButton2<String>(
                                                       items: cubit.regesterCityitems.map((String item) =>
                                                           DropdownMenuItem<String>(
                                                             value: item,
                                                             child: Text(
                                                               item,
                                                               style: const TextStyle(
                                                                 fontSize: 12,
                                                                 fontWeight: FontWeight.bold,
                                                                 color: Colors.grey,
                                                               ),
                                                               overflow: TextOverflow.ellipsis,
                                                             ),
                                                           ))
                                                           .toList(),
                                                       value: cubit.registerCityMenuValue,
                                                       onChanged: (value) {
                                                         cubit.registerCityMenu(value!);
                                                       },
                                                       buttonStyleData: ButtonStyleData(
                                                         padding: const EdgeInsets.only(left: 14, right: 14),
                                                         decoration: BoxDecoration(
                                                           color: Colors.white,
                                                           borderRadius: BorderRadius.circular(14),
                                                           boxShadow: kElevationToShadow[2],
                                                         ),
                                                       ),
                                                       iconStyleData: const IconStyleData(
                                                         icon: Icon(
                                                           Icons.menu,
                                                         ),
                                                         iconSize: 14,
                                                         iconEnabledColor: Colors.red,
                                                       ),
                                                       dropdownStyleData: DropdownStyleData(
                                                         maxHeight: 200,
                                                         width: 150,
                                                         decoration: BoxDecoration(
                                                           borderRadius: BorderRadius.circular(14),
                                                           color: Colors.white,
                                                         ),
                                                         offset: const Offset(-20, 0),
                                                         scrollbarTheme: ScrollbarThemeData(
                                                           radius: const Radius.circular(40),
                                                           thickness: MaterialStateProperty.all(5),
                                                           thumbVisibility: MaterialStateProperty.all(true),
                                                         ),
                                                       ),
                                                       menuItemStyleData: const MenuItemStyleData(
                                                         height: 30,
                                                         padding: EdgeInsets.only(left: 14, right: 14),
                                                       ),
                                                     ),
                                                   ),
                                                 ),
                                               ],
                                             ),
                                             const SizedBox(height: 10,),
                                             Row(
                                               children: [
                                                 Icon(Icons.location_city, color: defultColor,),
                                                 SizedBox(width: 12,),
                                                 Text('المركز',
                                                   style: TextStyle(
                                                       fontSize: 10,
                                                       fontWeight: FontWeight.w900,
                                                       color: Colors.grey
                                                   ),
                                                 ),
                                                 SizedBox(width: 10,),
                                                 Expanded(
                                                   child: ConditionalBuilder(
                                                     condition: cubit.registerCityMenuValue == 'الاسكندريه',
                                                     builder: (BuildContext context) {
                                                       return DropdownButtonHideUnderline(
                                                         child: DropdownButton2<String>(
                                                           items: cubit.registerGovernmentAlexItems.map((String item) =>
                                                               DropdownMenuItem<String>(
                                                                 value: item,
                                                                 child: Text(
                                                                   item,
                                                                   style: const TextStyle(
                                                                     fontSize: 10,
                                                                     fontWeight: FontWeight.bold,
                                                                     color: Colors.grey,
                                                                   ),
                                                                   overflow: TextOverflow.ellipsis,
                                                                 ),
                                                               ))
                                                               .toList(),
                                                           value: cubit.registerGovernmentAlexValue,
                                                           onChanged: (value) {
                                                             cubit.registerGovernmentAlexMenu(value!);
                                                           },
                                                           buttonStyleData: ButtonStyleData(
                                                             padding: const EdgeInsets.only(left: 14, right: 14),
                                                             decoration: BoxDecoration(
                                                               color: Colors.white,
                                                               borderRadius: BorderRadius.circular(14),
                                                               boxShadow: kElevationToShadow[2],
                                                             ),
                                                           ),
                                                           iconStyleData: const IconStyleData(
                                                             icon: Icon(
                                                               Icons.menu,
                                                             ),
                                                             iconSize: 10,
                                                             iconEnabledColor: Colors.red,
                                                           ),
                                                           dropdownStyleData: DropdownStyleData(
                                                             maxHeight: 300,
                                                             width: 200,
                                                             decoration: BoxDecoration(
                                                               borderRadius: BorderRadius.circular(14),
                                                               color: Colors.white,
                                                             ),
                                                             offset: const Offset(-20, 0),
                                                             scrollbarTheme: ScrollbarThemeData(
                                                               radius: const Radius.circular(40),
                                                               thickness: MaterialStateProperty.all(5),
                                                               thumbVisibility: MaterialStateProperty.all(true),
                                                             ),
                                                           ),
                                                           menuItemStyleData: const MenuItemStyleData(
                                                             height: 30,
                                                             padding: EdgeInsets.only(left: 14, right: 14),
                                                           ),
                                                         ),
                                                       );
                                                     },
                                                     fallback: (BuildContext context) {
                                                       return DropdownButtonHideUnderline(
                                                         child: DropdownButton2<String>(
                                                           items: cubit.registerGovernmentElbihiraItems.map((String item) =>
                                                               DropdownMenuItem<String>(
                                                                 value: item,
                                                                 child: Text(
                                                                   item,
                                                                   style: const TextStyle(
                                                                     fontSize: 10,
                                                                     fontWeight: FontWeight.bold,
                                                                     color: Colors.grey,
                                                                   ),
                                                                   overflow: TextOverflow.ellipsis,
                                                                 ),
                                                               ))
                                                               .toList(),
                                                           value: cubit.registerGovernmentElbihiraValue,
                                                           onChanged: (value) {
                                                             cubit.registerGovernmentElbihiraMenu(value!);
                                                           },
                                                           buttonStyleData: ButtonStyleData(
                                                             padding: const EdgeInsets.only(left: 14, right: 14),
                                                             decoration: BoxDecoration(
                                                               color: Colors.white,
                                                               borderRadius: BorderRadius.circular(14),
                                                               boxShadow: kElevationToShadow[2],
                                                             ),
                                                           ),
                                                           iconStyleData: const IconStyleData(
                                                             icon: Icon(
                                                               Icons.menu,
                                                             ),
                                                             iconSize: 10,
                                                             iconEnabledColor: Colors.red,
                                                           ),
                                                           dropdownStyleData: DropdownStyleData(
                                                             maxHeight: 200,
                                                             width: 200,
                                                             decoration: BoxDecoration(
                                                               borderRadius: BorderRadius.circular(14),
                                                               color: Colors.white,
                                                             ),
                                                             offset: const Offset(-20, 0),
                                                             scrollbarTheme: ScrollbarThemeData(
                                                               radius: const Radius.circular(40),
                                                               thickness: MaterialStateProperty.all(5),
                                                               thumbVisibility: MaterialStateProperty.all(true),
                                                             ),
                                                           ),
                                                           menuItemStyleData: const MenuItemStyleData(
                                                             height: 30,
                                                             padding: EdgeInsets.only(left: 14, right: 14),
                                                           ),
                                                         ),
                                                       );
                                                     },

                                                   ),
                                                 ),
                                               ],
                                             ),

                                             const SizedBox(height: 10,),
                                             Row(
                                               children: [
                                                 Row(
                                                   children: [
                                                     Icon(
                                                       Icons.transgender,
                                                       color: defultColor,
                                                     ),
                                                     const SizedBox(width: 10,),
                                                     const Text(
                                                       "النوع",
                                                       style: TextStyle(
                                                           fontWeight: FontWeight.w900,
                                                           fontSize: 12,
                                                           color: Colors.grey
                                                       ),
                                                     ),
                                                   ],
                                                 ),
                                                 Expanded(
                                                   child: RadioListTile(
                                                       title:const Text(
                                                         "ذكر",
                                                         style:TextStyle(
                                                           fontSize: 12,
                                                         ),
                                                       ),
                                                       activeColor: defultColor,
                                                       selected: cubit.Gender == "male" ? true : false,
                                                       value: "male",
                                                       groupValue: cubit.Gender,
                                                       onChanged: (val){
                                                         cubit.ChooseGender(val!);
                                                       }),
                                                 ),
                                                 Expanded(
                                                   child: RadioListTile(
                                                       title:const Text(
                                                         "انثي",
                                                         style:TextStyle(
                                                           fontSize: 12,
                                                         ),
                                                       ),
                                                       selected: cubit.Gender == "female" ? true : false,
                                                       activeColor: defultColor,
                                                       value: "female",
                                                       groupValue: cubit.Gender,
                                                       onChanged: (val){
                                                         cubit.ChooseGender(val!);
                                                       }),
                                                 ),
                                               ],
                                             ),
                                             const SizedBox(height: 10,),
                                             Row(
                                               children: [
                                                 Icon(Icons.bloodtype,color: defultColor,),
                                                 const SizedBox(width: 10,),
                                                 const Text(
                                                     "زمرة الدم",
                                                   style: TextStyle(
                                                       fontWeight: FontWeight.w900,
                                                       fontSize: 12,
                                                       color: Colors.grey
                                                   ),
                                                 ),
                                                 const SizedBox(width: 15,),
                                                 DropdownButtonHideUnderline(
                                                   child: DropdownButton2<String>(
                                                     items: cubit.items.map((String item) =>
                                                         DropdownMenuItem<String>(
                                                           value: item,
                                                           child: Text(
                                                             item,
                                                             style: const TextStyle(
                                                               fontSize: 14,
                                                               fontWeight: FontWeight.bold,
                                                               color: Colors.grey,
                                                             ),
                                                             overflow: TextOverflow.ellipsis,
                                                           ),
                                                         ))
                                                         .toList(),
                                                     value: cubit.dropdownBloodMenuValue,
                                                     onChanged: (value) {
                                                       cubit.BloodTypeMenu(value!);
                                                     },
                                                     buttonStyleData: ButtonStyleData(
                                                       padding: const EdgeInsets.only(left: 14, right: 14),
                                                       decoration: BoxDecoration(
                                                         color: Colors.white,
                                                         borderRadius: BorderRadius.circular(14),
                                                         boxShadow: kElevationToShadow[2],
                                                       ),
                                                       width: 100
                                                     ),
                                                     iconStyleData: const IconStyleData(
                                                       icon: Icon(
                                                         Icons.menu,
                                                       ),
                                                       iconSize: 14,
                                                       iconEnabledColor: Colors.red,
                                                     ),
                                                     dropdownStyleData: DropdownStyleData(
                                                       maxHeight: 200,
                                                       width: 80,
                                                       decoration: BoxDecoration(
                                                         borderRadius: BorderRadius.circular(14),
                                                         color: Colors.white,
                                                       ),
                                                       offset: const Offset(-20, 0),
                                                       scrollbarTheme: ScrollbarThemeData(
                                                         radius: const Radius.circular(40),
                                                         thickness: MaterialStateProperty.all(5),
                                                         thumbVisibility: MaterialStateProperty.all(true),
                                                       ),
                                                     ),
                                                     menuItemStyleData: const MenuItemStyleData(
                                                       height: 30,
                                                       padding: EdgeInsets.only(left: 14, right: 14),
                                                     ),
                                                   ),
                                                 ),
                                               ],
                                             ),
                                             const SizedBox(height: 20,),
                                           ],
                                         ),
                                       ),
                                     ),
                                   ),
                                 ),
                                 defaultButton(
                                    text: "إنشاء حساب",
                                    width: 140,
                                    radius: 35,
                                    function: (){
                                      print(cubit.uploadImageToAPI);
                                      if(formKey.currentState!.validate()){
                                        // if (cubit.passController.text != cubit.rePassController.text){
                                        //   AwesomeDialog(
                                        //       context: context,
                                        //       animType: AnimType.scale,
                                        //       dialogType: DialogType.info,
                                        //       body: Center(child: Text(
                                        //         ' لابد مت تطابق كلمه السر',
                                        //         style: TextStyle(fontStyle: FontStyle.italic),
                                        //       ),),
                                        //       title: 'ملحوظه ',
                                        //       btnOkOnPress: () {},
                                        //       btnOkColor: defultColor,
                                        //       dialogBackgroundColor: Colors.white
                                        //   )..show();
                                        // }else{
                                        //   cubit.signUp(context);
                                        // }
                                      }
                                    }, color: defultColor,
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
                                   "ليس حساب بالفعل ..." ,
                                   style: TextStyle(
                                       fontSize: 10,
                                       color: Colors.white),
                                 ),

                                 defaultTextButton(
                                   fontSize: 10,
                                     color: Colors.orangeAccent,
                                     function: (){
                                       navigateTo(context, const LoginForm());
                                     },
                                     buttonlable: "${getLang(context, "login")}"),
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


//---------------------------------------------------
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
