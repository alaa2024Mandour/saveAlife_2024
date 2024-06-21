import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_a_life_2024/shared/components/shared_component.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import '../home_page/home_page.dart';
import '../user_cubit/userCubit.dart';
import '../user_cubit/userStatus.dart';

class Rewards extends StatelessWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserStatus>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        var cubit = UserCubit.get(context);
        return  Scaffold(
          backgroundColor: defultColor,
          body: Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 450,
                  width: 350,
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 35,
                        ),
                        Text('تهانينا لك',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.red,
                          ),),
                        SizedBox(
                          height: 2,),
                        Text('لقد حصلت علي درجات جديدة'
                            '\n لذلك أحصل علي عروضك',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height:15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image(image: AssetImage('assets/images/icons/icons8-qr-code-64 (1).png')),
                                  SizedBox( height: 20),
                                  Text(
                                    'مسح ضوئي \n للحصول علي \n الخصم',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              color: Colors.grey,
                              width: 3,
                              height: 200,
                            ),
                            SizedBox(width: 5,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  GestureDetector(
                                      onTap: (){
                                        showDialog(
                                            context: context,
                                            builder: (context) => SingleChildScrollView(
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom: 25.0),
                                                child: Column(
                                                  children: [
                                                    AlertDialog(
                                                      contentPadding: const EdgeInsets.all(0),
                                                      content: Container(
                                                        width: MediaQuery.of(context).size.width,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(20),
                                                          gradient: LinearGradient(
                                                              colors: [
                                                                Colors.green ,
                                                                Colors.white,
                                                              ],
                                                              begin: const FractionalOffset(0.0, 0.0),
                                                              end: const FractionalOffset(1.0, 0.0),
                                                              stops: [0.0, 1.0],
                                                              tileMode: TileMode.clamp),
                                                        ),
                                                        child:  Center(
                                                          child: Container(
                                                            padding: EdgeInsets.symmetric(horizontal: 20),
                                                            child: Stack(
                                                              children: [
                                                                Transform.translate(
                                                                  offset: Offset(-90,-50),
                                                                  child: Image(
                                                                    image: AssetImage("assets/images/icons/splash.png"),width: 150,
                                                                  ),
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    AppBar(
                                                                      leading: IconButton(
                                                                        onPressed: () {
                                                                          navigateTo(context, Rewards());
                                                                        },
                                                                        icon: Icon(Icons.dangerous_outlined , color: Colors.red,),),
                                                                      backgroundColor: Colors.transparent,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                            flex: 3,
                                                                            child: Column(
                                                                              children: [
                                                                                bloodCheckInfo("رقم العمليه : ","12345"),
                                                                                bloodCheckInfo(" اسم المتبرع :  ","${cubit.user?.user?.name}"),
                                                                                bloodCheckInfo("الرقم القومي للمتبرع : ","3024454956594"),
                                                                                bloodCheckInfo("فصيله الدم : ","${cubit.user?.user?.bloodtype}"),
                                                                                bloodCheckInfo("اسم بنك الدم : ","كوم الدكه"),
                                                                              ],
                                                                            )
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Container(
                                                                      height: 50,
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      insetPadding: const EdgeInsets.all(10),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                        );
                                      },
                                      child: Image(image: AssetImage('assets/images/icons/icons8-qr-code-64.png'))),
                                  SizedBox(height: 20,),
                                  Text('أنقر علي الرمز \n لتحصل علي \nشيك الدم',
                                    style: TextStyle(

                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),)
                                ],
                              ),
                            ),
                          ],
                        ),

                      ]

                  ),
                ),
                Transform.translate(
                  offset: Offset(0,-90),
                  child: Image(
                    image: AssetImage("assets/images/icons/icons8-congratulations-94.png"),width: 179,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                      onPressed: (){
                        navegateAndFinish(context, UserHomePage());
                      },
                      icon: Icon(Icons.highlight_remove_sharp,color: defultColor,)),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
Widget bloodCheckInfo(String title ,var value) => Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0),
  child: Row(
    children: [
      Expanded(
        child: Text(
          title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w900,
        ),
        ),
      ),
      SizedBox(width: 10,),
      Text(
          "${value}",
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w900,
          color: defultColor
        ),
      )
    ],
  ),
);