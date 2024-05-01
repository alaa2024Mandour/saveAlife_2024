import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:save_a_life_2024/shared/components/shared_component.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import '../../user_layouts/user_cubit/userCubit.dart';
import '../../user_layouts/user_cubit/userStatus.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<UserCubit,UserStatus>(
        listener: (BuildContext context, UserStatus state) {  },
        builder: (BuildContext context, UserStatus state) {
          var cubit = UserCubit.get(context);
          return   AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent,),
            child: Scaffold(
              appBar: AppBar(
                leadingWidth: double.infinity,
                backgroundColor: Colors.transparent,
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
                body: SizedBox(
                  width: double.infinity,
                  child:  Column(
                    children: [
                      const SizedBox(height:10),
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
                                  GestureDetector(
                                    onTap: (){},
                                    child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: defultColor,
                                        child: const Icon(Icons.add,color: Colors.white70,)
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
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
                      const SizedBox(height:10),
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
