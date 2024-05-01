import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:save_a_life_2024/user_layouts/profile_setting/rewards.dart';
import '../../shared/components/shared_component.dart';
import '../../shared/style/colors.dart';
import '../Login_page/login form.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          width:double.infinity,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/icons/female.jpeg'),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: defultColor,
                      child: Icon(Icons.add,color: Colors.white,),
                    ),
                  ),
                ],
              ),
              Text('يارا',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(
                height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('الأسكندرية'),
                  Icon(Icons.location_on),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('A+',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                      SizedBox(
                        height: 1,),
                      Text(
                        'فصيلة الدم',
                        style:TextStyle(
                          color: Colors.grey,
                        ),),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    color: Colors.red,
                    width: 2,
                    height: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text('21 سنه',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                      SizedBox(
                        height: 1,),
                      Text(
                        'العمر',
                        style:TextStyle(
                          color: Colors.grey,
                        ),),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: defultColor,
                    ),
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image(
                                            image: AssetImage('assets/images/icons/pagde.png')
                                        ),
                                        Positioned(
                                          top: 30,
                                          child: Text(
                                            "+5",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w900,
                                                color: defultColor
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('التقيم',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    RatingBar.builder(
                                        ignoreGestures: true,
                                        initialRating: 0,
                                        minRating: 0.5,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 3,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 1),
                                        itemBuilder: (context,_)=>Icon(Icons.star,size: 2,color: Colors.amber,),
                                        onRatingUpdate: (rating){

                                        }
                                    ),
                                    SizedBox(height: 15,),
                                    defaultButton(
                                        text: "الخصومات",
                                        function: (){
                                          navegateAndFinish(context,Rewards());
                                        },
                                        color: Colors.white,
                                        textColor: defultColor,
                                    )

                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  color: Colors.white,
                                  width: 4,
                                  height: 200,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    userData("الاسم رباعي",'يارا محمد السيد عبد الحميد'),
                                    userData("البريد الايكتروني", "yara@yahoo.com"),
                                    userData("رقم الهاتف", "01284742101"),
                                    userData("العنوان","السيوف"),
                                    userData("فحص الدم","نتيجة الفحص"),
                                    userData("فصيله الدم","A+"),
                                    userData("أخر ميعاد قمت فيه بالتبرع", '1/1/2024')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0,-30),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow:const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0,
                                ),
                              ]
                          ),
                          width: 60,
                          height: 60,
                        ),
                        const Image(
                          image: AssetImage("assets/images/icons/splash.png"),
                          width: 60,
                          height:60 ,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: borderButton(
                      text: "الخروج",
                      function: (){
                        navegateAndFinish(context, LoginForm());
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Widget userData (String title, String value)=>Padding(
  padding: const EdgeInsets.symmetric(vertical: 5),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
          title,
          style:TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold
          )
      ),
      SizedBox(height: 5,),
      Text(
          value,
          style:TextStyle(
              color: Colors.amber,
              fontSize: 10,
              fontWeight: FontWeight.w900
          )
      ),
    ],
  ),
);

