import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:save_a_life_2024/shared/components/shared_component.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import '../../user_layouts/Login_page/signup form.dart';
import '../../user_layouts/Login_page/user_login.dart';

class StuffSAndUser extends StatefulWidget {
  const StuffSAndUser({Key? key}) : super(key: key);

  @override
  State<StuffSAndUser> createState() => _StuffSAndUserState();
}

class _StuffSAndUserState extends State<StuffSAndUser> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool is_user = true;


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(statusBarColor:defultColor,),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Stack(
               alignment:Alignment.bottomCenter,
               children: [
                 Image(
                   image: AssetImage('assets/images/cerves pages/home page2  the animate.png'),
                   height: 365.14,
                 ),
                 Column(
                   children: [
                     Image(
                       image: AssetImage('assets/images/icons/hay_blood-removebg-preview 1.png'),
                       height: 169,
                       width: 214,
                     ),
                     Container(
                         margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                         decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(44),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(0.5),
                             spreadRadius: 4,
                             blurRadius: 4,
                             offset: Offset(0, 3), // changes position of shadow
                           ),
                         ],
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                                 "خصيصا لك : ",
                               style: TextStyle(
                                 fontSize: 17,
                                 fontWeight: FontWeight.w700,
                                 color: defultColor

                               ),
                             ),
                             Row(
                               children: [
                                 Expanded(
                                   flex:2,
                                   child: Text(
                                     "نحن نقوم بتطوير اصدار جديد لمساعدتك في المعرفه اكثر حول التبرع بالدم",

                                     style: TextStyle(
                                         fontSize: 14,
                                         fontWeight: FontWeight.w400,
                                         color: Text_Color,
                                     ),
                                   ),
                                 ),
                                 Expanded(
                                   child: Image(
                                       image: AssetImage('assets/images/icons/splash.png'),
                                   ),
                                 )
                               ],
                             ),
                           ],
                         ),
                       )
                     ),
                   ],
                 ),
               ],
             ),
              SizedBox(height: 35,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "التسجيل الدخول : " ,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: defultColor
                      ),
                    ),

                    SizedBox(height: 30,),

                    Row (
                      children: [
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              is_user=true;
                            });
                            await Future.delayed(Duration(milliseconds: 400), ()
                            {
                              navigateTo(context, SignUpForm());
                            });
                          },
                            child: CircleAvatar(
                              radius: 65,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Image(image: AssetImage('assets/images/icons/avatar.png'),
                                    width: 60,),
                                    Text(
                                      "مستخدم",
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              backgroundColor: is_user? defultColor : HexColor("#D9D9D9"),
                            ),
                          ),
                        Spacer(),
                        Container(
                          height: 256,
                          width: 2,
                          color: defultColor,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              is_user=false;
                            });
                            //navigateTo(context, );
                          },
                          child: CircleAvatar(
                            radius: 65,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Image(image: AssetImage('assets/images/icons/doctor1.png'),
                                    width: 60,),
                                  Text(
                                    "مسؤل",
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w700,
                                        color:Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            backgroundColor: !is_user? defultColor : HexColor("#D9D9D9"),
                          ),

                        ),
                      ],
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
}
