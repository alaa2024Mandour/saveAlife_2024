import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import '../../shared/components/shared_component.dart';
import '../../user_layouts/user_cubit/userCubit.dart';
import '../../user_layouts/user_cubit/userStatus.dart';
import '../users_donors_list/users_donors_list.dart';


var fileFormKey = GlobalKey<FormState>();

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserStatus>(
            listener: (BuildContext context, UserStatus state) { },
            builder: (BuildContext context, UserStatus state) {
              var userCubit = UserCubit.get(context);
              return   AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light.copyWith(statusBarColor:defultColor,),
                child: Scaffold(
                    body: SizedBox(
                      width: double.infinity,
                      child:  Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                AppBar(
                                  scrolledUnderElevation:0.0,
                                  leadingWidth: double.infinity,
                                  backgroundColor: Colors.white,
                                  actions: const[
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage("assets/images/icons/icons8-doctor-40.png"),),
                                    ),
                                  ],
                                  leading: const Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child:  Text("ألاء ياسر",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15, color: Colors.black),),
                                  ),
                                ),
                                const SizedBox(height:20),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){},
                                      child: Container(
                                        width: 94,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(19),
                                            boxShadow: [
                                              BoxShadow(
                                                color: HexColor('#C4C4C4'),
                                                blurRadius: 4.0,
                                                spreadRadius: 2.0,
                                              ),
                                            ]),
                                        child: Center(
                                          child: Image.asset("assets/images/icons/Ellipse 104.png",width: double.infinity,),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 35,),
                                    Container(
                                      width: 94,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(19),
                                          boxShadow: [
                                            BoxShadow(
                                              color: HexColor('#C4C4C4'),
                                              blurRadius: 4.0,
                                              spreadRadius: 2.0,
                                            ),
                                          ]),
                                      child: Center(
                                        child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Image.asset("assets/images/icons/Group 52.png"),
                                            Transform.translate(
                                              offset: Offset(3,0),
                                              child:GestureDetector(
                                                onTap: (){
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) => SingleChildScrollView(
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(bottom: 25.0),
                                                          child: Column(
                                                            children: [
                                                              AlertDialog(
                                                                content: SizedBox(
                                                                  width: MediaQuery.of(context).size.width,
                                                                  child:  Center(
                                                                    child: Container(
                                                                      child: Column(
                                                                        children: [
                                                                          Container(
                                                                            padding: EdgeInsets.only(top:10,bottom: 10,right: 0,left: 25),
                                                                            width: double.infinity,
                                                                            decoration: BoxDecoration(
                                                                                color: defultColor,
                                                                                borderRadius: BorderRadius.circular(15)
                                                                            ),
                                                                            child: Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                IconButton(
                                                                                    onPressed: (){
                                                                                      navegateAndFinish(context,AdminHome() );
                                                                                    },
                                                                                    icon: Icon(Icons.dangerous_outlined, color: Colors.white,)),
                                                                                Spacer(),
                                                                                Text(
                                                                                  'إرسال نتيجه فحص الدم للمتبرع ',
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.w900,
                                                                                    color: Colors.white,
                                                                                    fontSize: 12,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          const SizedBox(height: 20,),
                                                                          Form(
                                                                            key: fileFormKey,
                                                                            child: Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 20),
                                                                              child :Column(
                                                                                children: [
                                                                                  Container(
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          "البريد الالكتروني للمتبرع : ",
                                                                                          style: TextStyle(
                                                                                              fontSize: 10
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: TextFormField(
                                                                                            keyboardType: TextInputType.emailAddress,
                                                                                            controller: userCubit.donorEmail,
                                                                                            decoration: InputDecoration(
                                                                                              labelStyle: TextStyle(fontSize: 12, color: Colors.grey, ),
                                                                                              fillColor: Colors.transparent,
                                                                                              border: InputBorder.none,
                                                                                            ),
                                                                                            style: TextStyle(
                                                                                              fontSize: 15,
                                                                                              fontFamily: 'Tajawal',
                                                                                            ),
                                                                                            validator: (value) {
                                                                                              if (value == null || value.isEmpty) return 'لابد من ملئ هذا الحقل';
                                                                                              return null;
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                                                                    decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                        borderRadius: BorderRadius.circular(19),
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            color: Colors.grey,
                                                                                            blurRadius: 4.0,
                                                                                            spreadRadius: 2.0,
                                                                                          ),
                                                                                        ]
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(height: 15,),
                                                                                  Container(
                                                                                    height: 45,
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          " ملف الفحص : ",
                                                                                          style: TextStyle(
                                                                                              fontSize: 10
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                            child: Text(
                                                                                              userCubit.fileName == null?  "اسم الملف" : " ${userCubit.fileName}",
                                                                                              style: TextStyle(
                                                                                                  fontSize: 11,
                                                                                                  color: Colors.grey
                                                                                              ),
                                                                                            )
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                                                                    decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                        borderRadius: BorderRadius.circular(19),
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            color: Colors.grey,
                                                                                            blurRadius: 4.0,
                                                                                            spreadRadius: 2.0,
                                                                                          ),
                                                                                        ]
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(height: 30,),
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                                                                                    decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            color:Colors.grey,
                                                                                            blurRadius: 4.0,
                                                                                            spreadRadius: 2.0,
                                                                                          ),
                                                                                        ]
                                                                                    ),
                                                                                    child: Column(
                                                                                      children: [
                                                                                        GestureDetector(
                                                                                          child: Image.asset("assets/images/icons/icons8-add-file-96.png"),
                                                                                          onTap: (){
                                                                                            userCubit.uploadFile();
                                                                                          },
                                                                                        ),
                                                                                        SizedBox(height: 15,),
                                                                                        Text(
                                                                                          "قم برفع الملف المراد ",
                                                                                          style: TextStyle(
                                                                                              fontSize: 12,
                                                                                              color: Colors.grey
                                                                                          ),
                                                                                        )

                                                                                      ],
                                                                                    ),
                                                                                  ),

                                                                                  const SizedBox(height: 20,),
                                                                                  Row(
                                                                                    children: [
                                                                                      Expanded(
                                                                                          child: defaultButton(
                                                                                              color: defultColor,
                                                                                              text: "إرسال",
                                                                                              function: (){
                                                                                                if(fileFormKey.currentState!.validate()) {
                                                                                                  navigateTo(context, AdminHome());
                                                                                                }
                                                                                              },
                                                                                              width: 350
                                                                                          )),
                                                                                      SizedBox(width: 25,),
                                                                                      Expanded(child: defaultButton(color: Colors.grey, text: "إلغاء", function: (){},width: 350)),
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
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
                                                child: CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor: defultColor,
                                                    child: const Icon(Icons.add,color: Colors.white70,)
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 35,),
                                    Container(
                                      width: 94,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(19),
                                          boxShadow: [
                                            BoxShadow(
                                              color: HexColor('#C4C4C4'),
                                              blurRadius: 4.0,
                                              spreadRadius: 2.0,
                                            ),
                                          ]),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: (){
                                              navigateTo(context, DonorsScreen());
                                          },
                                          child: Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              Image.asset("assets/images/icons/donor.png",width: 60,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only( top: 40,right: 20,left: 20,bottom:10 ),
                            child: Container(
                              height: 34,
                              width: 430,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  items: userCubit.donorCityitems.map((String item) =>
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
                                  value: userCubit.donorCityMenuValue,
                                  onChanged: (value) {
                                    userCubit.donorCityMenu(value!);
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
                          const SizedBox(height:20),
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
                          const SizedBox(height:10),
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
                    )
                ),
              );
            }
        );

  }
}
