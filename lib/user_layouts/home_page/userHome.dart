import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import '../user_cubit/userCubitstatus.dart';
import '../user_cubit/userSubit.dart';

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
                    Image(
                      image: AssetImage(
                          'assets/images/cerves pages/before verified user page.png'),
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    AppBar(
                      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
                        statusBarColor: Colors.transparent,
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      leading: IconButton(
                        onPressed: () {
                          //navigateTo(context, cubit.bottomScreen[4]);
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      actions: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                            'assets/images/icons/female.jpeg',
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.only(top: 80),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'مرحبا , ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            ' أسماء ',
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
                  child: Image(
                    image:
                        AssetImage('assets/images/icons/icons8-alert-100.png'),
                    width: 35,
                  ),
                ),
                SizedBox(height:10),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                    child: MediaQuery.removePadding(
                      removeTop: true,
                      removeBottom: true,
                      context: context,
                      child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              Notification(notificationList[index]),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: notificationList.length),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    height: 34,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ListTile(
                      title: Text(
                          "بحث عن المحافظه",
                        style: TextStyle(
                          fontSize: 10,
                          color: HexColor('#ADADAD')
                        ),
                      ),
                      trailing: PopupMenuButton(
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                              child: Text(
                                  "الاسكندريه",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: HexColor('#ADADAD')
                                ),
                              ),
                              value: "الاسكندريه",
                          ),
                          PopupMenuItem(
                            child: Text(
                              "البحيره",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: HexColor('#ADADAD')
                              ),
                            ),
                            value: "البحيره",
                          ),
                        ],
                        onSelected: (String newValue){
                          cubit.citySearch(cubit.Title,newValue);
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 48,
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            BloodType(bloodTypeList[index]),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        itemCount: bloodTypeList.length),
                  ),
                ),
                SizedBox(height:10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Text(
                          "المتبرعين",
                        style:TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        ) ,
                      ),
                      Spacer(),
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
                SizedBox(height:10),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                    child:  MediaQuery.removePadding(
                      removeTop: true,
                      removeBottom: true,
                      context: context,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Donors(),
                          separatorBuilder: (context, index) => SizedBox(height: 10,),
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

Widget Notification(notificationModel model) => Container(
      padding: EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 5),
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
              SizedBox(
                width: 5,
              ),
              Text(
                '${model.title}',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: model.colorTitle,
                ),
              ),
            ],
          ),
          Text(
            '${model.explainNotifi}',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: model.explaintColor,
            ),
          )
        ],
      ),
    );

Widget BloodType(bloodTypesModel model) => GestureDetector(
      onTap: () {},
      child: Container(
        width: 57,
        height: 48,
        decoration: BoxDecoration(
            color: defultColor, borderRadius: BorderRadius.circular(9)),
        child: Center(
          child: Text(
            '${model.bloodType}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

Widget Donors() => Container(
  padding: EdgeInsetsDirectional.all(10),
  color: Colors.white,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35)
            ),
            child: Image(
              image: AssetImage('assets/images/icons/male.jpg'),
              width: 70,
              height: 70,
              fit: BoxFit.fill,
            ),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                  'Mohammed Ahmad',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Text(
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
          Spacer(),
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
