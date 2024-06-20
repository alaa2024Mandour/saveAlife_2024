import 'dart:io';
import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:save_a_life_2024/shared/network/endPoints/end_points.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import '../../shared/network/remote/modules/userModel.dart';
import '../user_cubit/userCubit.dart';
import '../user_cubit/userStatus.dart';

//---------------------- Notification Model --------------------------
class notificationModel {
  final Color colorTitle, explaintColor;
  final String title, explainNotifi, image;

  notificationModel(
      {required this.colorTitle,
      required this.explaintColor,
      required this.image,
      required this.title,
      required this.explainNotifi});
}

//---------------------- Notification Model --------------------------
class bloodTypesModel {
  final String bloodType;

  bloodTypesModel({required this.bloodType}) {}
}


class UserHome extends StatelessWidget {
  UserHome({Key? key}) : super(key: key);

  List<notificationModel> notificationList = [
    notificationModel(
        colorTitle: HexColor('#051153'),
        explaintColor: HexColor('#9C9C9C'),
        image: "assets/images/icons/icons8-report-card-25.png",
        title: "نتيجه تبرعك ",
        explainNotifi: "اضغط هنا لتصل الي نتيجه تحاليل اخر تبرع لك "),
    notificationModel(
        colorTitle: HexColor('#336D06'),
        explaintColor: HexColor('#9C9C9C'),
        image: "assets/images/icons/icons8-congratulations-94.png",
        title: "مبروووك ",
        explainNotifi:
            "لقد حققت مستوي اعلي بسبب تبرعك بالدم اضغط هنا للحصول علي شارتك الجديدة"),
    notificationModel(
        colorTitle: HexColor('#F61D19'),
        explaintColor: HexColor('#9C9C9C'),
        image: "assets/images/icons/icons8-reminder-67.png",
        title: "تذكير بالتبرع بالدم",
        explainNotifi: " لقد تبرعت منذ ثلاثة اشهر يمكن الان التبرع بالدم "),
  ];
  List<bloodTypesModel> bloodTypeList = [
    bloodTypesModel(bloodType: '+A'),
    bloodTypesModel(bloodType: '-A'),
    bloodTypesModel(bloodType: '+B'),
    bloodTypesModel(bloodType: '-B'),
    bloodTypesModel(bloodType: '+AB'),
    bloodTypesModel(bloodType: '-AB'),
    bloodTypesModel(bloodType: '+O'),
    bloodTypesModel(bloodType: '-O'),
  ];
  @override

  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStatus>(
        listener: (BuildContext context, UserStatus state) {},
        builder: (BuildContext context, UserStatus state) {
          var cubit = UserCubit.get(context);
             return Scaffold(
               backgroundColor: HexColor('#EAEAEA'),
               body: Column(
                 children: [
                   Stack(
                     //alignment: Alignment.center,
                     children: [
                       const Image(
                         image: AssetImage(
                             'assets/images/cerves pages/before verified user page.png'),
                         height: 150,
                         width: double.infinity,
                         fit: BoxFit.fill,
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 20.0),
                         child: AppBar(
                           systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
                             statusBarColor: Colors.transparent,
                           ),
                           backgroundColor: Colors.transparent,
                           elevation: 0.0,
                           leading: IconButton(
                             onPressed: () {
                               //navigateTo(context, cubit.bottomScreen[4]);
                             },
                             icon: const Icon(
                               Icons.menu,
                               color: Colors.white,
                             ),
                           ),
                           actions:  [
                             // cubit.profilePicture == null?
                             CircleAvatar(
                               radius: 25,
                               backgroundImage:NetworkImage('${cubit.userGet!.avatar}'),
                               backgroundColor: Colors.transparent,
                             )
                             //     :   CircleAvatar(
                             //   radius: 35,
                             //   backgroundImage: FileImage(File(cubit.profilePicture!.path)),
                             // )
                           ],
                         ),
                       ),
                       Container(
                         padding: const EdgeInsetsDirectional.only(top: 80),
                         child: Row(
                           mainAxisSize: MainAxisSize.max,
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Text(
                               'مرحبا ,  ',
                               style: TextStyle(
                                 color: Colors.white,
                               ),
                             ),
                             Text(
                               '${cubit.userGet?.name}',
                               // '${cubit.userData!.name}',
                               style: TextStyle(
                                 color: Colors.white,
                               ),
                             ),
                           ],
                         ),
                       )
                     ],
                   ),
                   FloatingActionButton(
                     onPressed: () {
                       // ConditionalBuilder(
                       //   condition: null,
                       //   builder: (BuildContext context) {  },
                       //   fallback: (BuildContext context) {  },
                       //
                       // );
                     },
                     child: const Image(
                       image:
                       AssetImage('assets/images/icons/icons8-alert-100.png'),
                       width: 35,
                     ),
                   ),
                   const SizedBox(height:10),
                   Expanded(
                     flex: 4,
                     child: Container(
                       padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                       child: MediaQuery.removePadding(
                         removeTop: true,
                         removeBottom: true,
                         context: context,
                         child: ListView.separated(
                             physics: const NeverScrollableScrollPhysics(),
                             itemBuilder: (context, index) =>
                                 notification(notificationList[index]),
                             separatorBuilder: (context, index) => const SizedBox(
                               height: 10,
                             ),
                             itemCount: notificationList.length),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
                     child: Container(
                       height: 34,
                       width: 430,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(25),
                       ),
                       child: DropdownButtonHideUnderline(
                         child: DropdownButton2<String>(
                           items: cubit.donorCityitems.map((String item) =>
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
                           value: cubit.donorCityMenuValue,
                           onChanged: (value) {
                             cubit.donorCityMenu(value!);
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
                   ),
                   Expanded(
                     child: Container(
                       height: 48,
                       padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                       child: ListView.separated(
                           physics: const BouncingScrollPhysics(),
                           scrollDirection: Axis.horizontal,
                           itemBuilder: (context, index) => bloodType(bloodTypeList[index]),
                           separatorBuilder: (context, index) => const SizedBox(
                             width: 10,
                           ),
                           itemCount: bloodTypeList.length),
                     ),
                   ),
                   const SizedBox(height:10),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                     child: Row(
                       children: [
                         const Text(
                           "المتبرعين",
                           style:TextStyle(
                             fontSize: 19,
                             color: Colors.black,
                           ) ,
                         ),
                         const Spacer(),
                         Text(
                           "الكل",
                           style:TextStyle(
                             fontSize: 19,
                             color: HexColor('#F61D19'),
                           ) ,
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(height:10),
                   Expanded(
                     flex: 5,
                     child: Container(
                       padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                       child:  MediaQuery.removePadding(
                         removeTop: true,
                         removeBottom: true,
                         context: context,
                         child: ListView.separated(
                             physics: const BouncingScrollPhysics(),
                             itemBuilder: (context, index) => donorsB_Pluse(),
                             separatorBuilder: (context, index) => const SizedBox(height: 10,),
                             itemCount: 10),
                       ),
                     ),
                   ),
                 ],
               ),
             );
        });
  }
}

//------------------------------------------------
String bloodTypeDonor = '';
Widget notification(notificationModel model) => Container(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: HexColor("#D9D9D9"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image(
                    image: AssetImage('${model.image}'),
                    width: 35,
                  ),
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: HexColor('#2B84B6'),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                model.title,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: model.colorTitle,
                ),
              ),
            ],
          ),
          Text(
            model.explainNotifi,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: model.explaintColor,
            ),
          )
        ],
      ),
    );

Widget bloodType(bloodTypesModel model) => GestureDetector(
      onTap: () {
        bloodTypeDonor= model.bloodType;
        print(bloodTypeDonor);
      },
      child: Container(
        width: 57,
        height: 48,
        decoration: BoxDecoration(
            color: defultColor, borderRadius: BorderRadius.circular(9)),
        child: Center(
          child: Text(
            model.bloodType,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

Widget donorsB_Pluse() => Container(
  padding: const EdgeInsetsDirectional.all(10),
  color: Colors.white,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35)
            ),
            child: const Image(
              image: AssetImage('assets/images/icons/male.jpg'),
              width: 70,
              height: 70,
              fit: BoxFit.fill,
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                  'Mohammed Ahmad',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  const Text(
                    'الحاله',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    ', النوع,',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#D9D9D9"),
                    ),
                  ),
                  Text(
                    ' 01112602464',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#D9D9D9"),
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Text(
              "B+",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: defultColor,
            ),
          ),
        ],
      ),
    );

Widget donorsB_min() => Container(
  padding: const EdgeInsetsDirectional.all(10),
  color: Colors.white,
  child: Row(
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35)
        ),
        child: const Image(
          image: AssetImage('assets/images/icons/male.jpg'),
          width: 70,
          height: 70,
          fit: BoxFit.fill,
        ),
      ),
      const Spacer(),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Mohammed Ahmad',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              const Text(
                'الحاله',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              Text(
                ', النوع,',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#D9D9D9"),
                ),
              ),
              Text(
                ' 01112602464',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#D9D9D9"),
                ),
              ),
            ],
          )
        ],
      ),
      const Spacer(),
      Text(
        "+B",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: defultColor,
        ),
      ),
    ],
  ),
);

Widget donorsA_Pluse() => Container(
  padding: const EdgeInsetsDirectional.all(10),
  color: Colors.white,
  child: Row(
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35)
        ),
        child: const Image(
          image: AssetImage('assets/images/icons/male.jpg'),
          width: 70,
          height: 70,
          fit: BoxFit.fill,
        ),
      ),
      const Spacer(),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Mohammed Ahmad',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              const Text(
                'الحاله',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              Text(
                ', النوع,',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#D9D9D9"),
                ),
              ),
              Text(
                ' 01112602464',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#D9D9D9"),
                ),
              ),
            ],
          )
        ],
      ),
      const Spacer(),
      Text(
        "+B",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: defultColor,
        ),
      ),
    ],
  ),
);

Widget donorsA_min() => Container(
  padding: const EdgeInsetsDirectional.all(10),
  color: Colors.white,
  child: Row(
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35)
        ),
        child: const Image(
          image: AssetImage('assets/images/icons/male.jpg'),
          width: 70,
          height: 70,
          fit: BoxFit.fill,
        ),
      ),
      const Spacer(),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Mohammed Ahmad',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              const Text(
                'الحاله',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              Text(
                ', النوع,',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#D9D9D9"),
                ),
              ),
              Text(
                ' 01112602464',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#D9D9D9"),
                ),
              ),
            ],
          )
        ],
      ),
      const Spacer(),
      Text(
        "+B",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: defultColor,
        ),
      ),
    ],
  ),
);

Widget donorsAB_Pluse() => Container(
  padding: const EdgeInsetsDirectional.all(10),
  color: Colors.white,
  child: Row(
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35)
        ),
        child: const Image(
          image: AssetImage('assets/images/icons/male.jpg'),
          width: 70,
          height: 70,
          fit: BoxFit.fill,
        ),
      ),
      const Spacer(),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Mohammed Ahmad',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              const Text(
                'الحاله',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              Text(
                ', النوع,',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#D9D9D9"),
                ),
              ),
              Text(
                ' 01112602464',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#D9D9D9"),
                ),
              ),
            ],
          )
        ],
      ),
      const Spacer(),
      Text(
        "+B",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: defultColor,
        ),
      ),
    ],
  ),
);

Widget donorsAB_min() => Container(
  padding: const EdgeInsetsDirectional.all(10),
  color: Colors.white,
  child: Row(
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35)
        ),
        child: const Image(
          image: AssetImage('assets/images/icons/male.jpg'),
          width: 70,
          height: 70,
          fit: BoxFit.fill,
        ),
      ),
      const Spacer(),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Mohammed Ahmad',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              const Text(
                'الحاله',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              Text(
                ', النوع,',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#D9D9D9"),
                ),
              ),
              Text(
                ' 01112602464',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#D9D9D9"),
                ),
              ),
            ],
          )
        ],
      ),
      const Spacer(),
      Text(
        "+B",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: defultColor,
        ),
      ),
    ],
  ),
);

Widget donorsO_Pluse() => Container(
  padding: const EdgeInsetsDirectional.all(10),
  color: Colors.white,
  child: Row(
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35)
        ),
        child: const Image(
          image: AssetImage('assets/images/icons/male.jpg'),
          width: 70,
          height: 70,
          fit: BoxFit.fill,
        ),
      ),
      const Spacer(),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Mohammed Ahmad',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              const Text(
                'الحاله',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              Text(
                ', النوع,',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#D9D9D9"),
                ),
              ),
              Text(
                ' 01112602464',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#D9D9D9"),
                ),
              ),
            ],
          )
        ],
      ),
      const Spacer(),
      Text(
        "+B",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: defultColor,
        ),
      ),
    ],
  ),
);

Widget donorsO_min() => Container(
  padding: const EdgeInsetsDirectional.all(10),
  color: Colors.white,
  child: Row(
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35)
        ),
        child: const Image(
          image: AssetImage('assets/images/icons/male.jpg'),
          width: 70,
          height: 70,
          fit: BoxFit.fill,
        ),
      ),
      const Spacer(),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Mohammed Ahmad',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              const Text(
                'الحاله',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              Text(
                ', النوع,',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#D9D9D9"),
                ),
              ),
              Text(
                ' 01112602464',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#D9D9D9"),
                ),
              ),
            ],
          )
        ],
      ),
      const Spacer(),
      Text(
        "+B",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: defultColor,
        ),
      ),
    ],
  ),
);

