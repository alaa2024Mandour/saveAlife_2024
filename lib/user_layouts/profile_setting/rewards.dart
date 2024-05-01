import 'package:flutter/material.dart';
import 'package:save_a_life_2024/shared/components/shared_component.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import 'package:save_a_life_2024/user_layouts/profile_setting/profile.dart';

import '../home_page/home_page.dart';

class Rewards extends StatelessWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                              Image(image: AssetImage('assets/images/icons/icons8-qr-code-64.png')),
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
  }
}
