
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_a_life_2024/shared/components/shared_component.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';

import '../../user_layouts/user_cubit/userCubit.dart';
import '../../user_layouts/user_cubit/userStatus.dart';
import '../admin_home_page/admin_home_page.dart';

class DonorsScreen extends StatelessWidget {
  const DonorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UserCubit(),
      child: BlocConsumer<UserCubit,UserStatus>(
          listener: (BuildContext context, UserStatus state) {  },
          builder: (BuildContext context, UserStatus state) {
            var cubit = UserCubit.get(context);
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light.copyWith(statusBarColor:Colors.transparent,),
              child: Scaffold(
                appBar: AppBar(
                  scrolledUnderElevation:0.0,
                  leading:  IconButton(
                      onPressed: (){
                        navigateTo(context, AdminHome());
                      }, icon:Icon(
                    Icons.arrow_back_ios,
                  )),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: Image(image: AssetImage(
                            'assets/images/icons/splash.png'),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Spacer(),
                          TextButton(
                              onPressed:(){
                                  cubit.isUser=true;
                                  if( cubit.isUser){
                                    cubit.isUserColor=defultColor;
                                    cubit.isDonorColor=Colors.grey;
                                  }
                                  cubit.togeleUserDonor();
                              },
                              child:Text(
                                'المستخدمين',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: cubit.isUserColor,
                                ),)),
                          Spacer(),
                          TextButton(
                              onPressed:(){
                                cubit.isUser=false;
                                if( !cubit.isUser){
                                  cubit.isDonorColor=defultColor;
                                  cubit.isUserColor=Colors.grey;
                                }
                                cubit.togeleUserDonor();
                              },
                              child:Text(
                                'المتبرعين',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: cubit.isDonorColor,
                                ),)),
                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),


                      ConditionalBuilder(
                        condition: cubit.isUser,
                        builder: (BuildContext context) {
                          return Column(
                            children: [
                              Text('جميع المستخدمين',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon:Icon(Icons.search) ,
                                    labelText: 'بحث ',
                                    border: OutlineInputBorder(),
                                  ),

                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  border: TableBorder.all(width: 1,color: Colors.white),
                                  children: [
                                    TableRow(
                                        children: [
                                          Text('الاسم',style: TextStyle( fontSize:12),),
                                          Text('العمر',style: TextStyle(fontSize:12),),
                                          Text('النوع',style: TextStyle(fontSize:12),),
                                          Text('نوع الفصيله',style: TextStyle(fontSize:12),),
                                          Text('الحدث',style: TextStyle(fontSize:12),),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: Colors.blue,
                                              text: "متبرع",
                                              function:(){},
                                              radius:50 )

                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: Colors.blue,
                                              text: "متبرع",
                                              function:(){},
                                              radius:50 )
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: Colors.blue,
                                              text: "متبرع",
                                              function:(){},
                                              radius:50 )
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: Colors.blue,
                                              text: "متبرع",
                                              function:(){},
                                              radius:50 )
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: Colors.blue,
                                              text: "متبرع",
                                              function:(){},
                                              radius:50 )
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: Colors.blue,
                                              text: "متبرع",
                                              function:(){},
                                              radius:50 )
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: Colors.blue,
                                              text: "متبرع",
                                              function:(){},
                                              radius:50 )
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: Colors.blue,
                                              text: "متبرع",
                                              function:(){},
                                              radius:50 )
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: Colors.blue,
                                              text: "متبرع",
                                              function:(){},
                                              radius:50 )
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: Colors.blue,
                                              text: "متبرع",
                                              function:(){},
                                              radius:50 )
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        fallback: (BuildContext context) {
                          return  Column(
                            children: [
                              Text('جميع المتبرعين',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon:Icon(Icons.search) ,
                                    labelText: 'بحث ',
                                    border: OutlineInputBorder(),
                                  ),

                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  border: TableBorder.all(width: 1,color: Colors.white),
                                  children: [
                                    TableRow(
                                        children: [
                                          Text('الاسم',style: TextStyle( fontSize:12),),
                                          Text('العمر',style: TextStyle(fontSize:12),),
                                          Text('النوع',style: TextStyle(fontSize:12),),
                                          Text('نوع الفصيله',style: TextStyle(fontSize:12),),
                                          Text('الحدث',style: TextStyle(fontSize:12),),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: defultColor,
                                              text: "حذف",
                                              function:(){},
                                              radius:50,
                                              fontSize: 10
                                          ),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: defultColor,
                                              text: "حذف",
                                              function:(){},
                                              radius:50,
                                              fontSize: 10
                                          ),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: defultColor,
                                              text: "حذف",
                                              function:(){},
                                              radius:50,
                                              fontSize: 10
                                          ),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: defultColor,
                                              text: "حذف",
                                              function:(){},
                                              radius:50,
                                              fontSize: 10
                                          ),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: defultColor,
                                              text: "حذف",
                                              function:(){},
                                              radius:50,
                                              fontSize: 10
                                          ),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: defultColor,
                                              text: "حذف",
                                              function:(){},
                                              radius:50,
                                              fontSize: 10
                                          ),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: defultColor,
                                              text: "حذف",
                                              function:(){},
                                              radius:50,
                                              fontSize: 10
                                          ),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: defultColor,
                                              text: "حذف",
                                              function:(){},
                                              radius:50,
                                              fontSize: 10
                                          ),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('عبدالرحمن',style: TextStyle( fontSize:12),),
                                          Text('23',style: TextStyle(fontSize:12),),
                                          Text('ذكر',style: TextStyle(fontSize:12),),
                                          Text('A',style: TextStyle(fontSize:12),),
                                          defaultButton(
                                              color: defultColor,
                                              text: "حذف",
                                              function:(){},
                                              radius:50,
                                              fontSize: 10
                                          ),
                                        ]
                                    ),


                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
