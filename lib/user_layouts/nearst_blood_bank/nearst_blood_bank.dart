import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/components/shared_component.dart';
import '../user_cubit/userCubit.dart';
import '../user_cubit/userStatus.dart';
import 'package:geocoding/geocoding.dart';



class BloodBankModel {
  final String bankIcon,bankName;
  final dynamic time,distance;

  BloodBankModel(
      {required this.bankIcon,
        required this.bankName,
        required this.time,
        required this.distance,});
}

class NearestBank extends StatelessWidget {
   NearestBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserStatus>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        var cubit = UserCubit.get(context);
        List<BloodBankModel> BloodBankAlexList = [
          BloodBankModel(
            bankName: "بنك دم كوم الدكه بمحطه مصر",
            bankIcon: "assets/images/icons/icons8-hospital-48.png",
            time: 12,
            distance: cubit.getDistance(cubit.KomEdekaLat, cubit.KomEdekaLong).toString(),
          ),
          BloodBankModel(
            bankName: "بنك دم الشاطبي",
            bankIcon: "assets/images/icons/icons8-hospital-30.png",
            time: 120,
            distance:  cubit.getDistance(cubit.ElshatbyaLat, cubit.ElHelalaLong).toString(),
          ),
          BloodBankModel(
            bankName: "بنك دم الهلال الاحمر ببكوس",
            bankIcon: "assets/images/icons/icons8-hospital-48.png",
            time: 60,
            distance:  cubit.getDistance(cubit.ElHelalaLat, cubit.ElshatbyLong).toString(),
          ),
        ];
        List<BloodBankModel> BloodBankBihiraList = [
          BloodBankModel(
            bankName: "بنك دم كوم حماده",
            bankIcon: "assets/images/icons/icons8-hospital-48.png",
            time: 12,
            distance: 30,
          ),
          BloodBankModel(
            bankName: "بنك دم دمنهور",
            bankIcon: "assets/images/icons/icons8-hospital-30.png",
            time: 120,
            distance: 66,
          ),
          BloodBankModel(
            bankName: "بنك دم ايتاي البارود",
            bankIcon: "assets/images/icons/icons8-hospital-48.png",
            time: 60,
            distance: 35,
          ),
        ];
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 500,
                child:Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset("assets/images/cerves pages/map.jpeg", fit: BoxFit.cover,alignment: Alignment.topCenter,width: double.infinity,),
                    Positioned(
                      top: 150,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          items: cubit.bloodBanktems.map((String item) =>
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
                          value: cubit.bloodBankValue,
                          onChanged: (value) {
                            cubit.bloodBankMenu(value!);
                          },
                          buttonStyleData: ButtonStyleData(
                            width: 250,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: kElevationToShadow[2],
                            ),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.search,
                            ),
                            iconSize: 14,
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
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0,
                                ),
                              ]
                          ),
                          width: 80,
                          height: 80,
                        ),
                        Image(
                          image: AssetImage("assets/images/icons/splash.png"),
                          width: 100,
                          height:100 ,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ],

                ),
              ),

              // defaultButton(
              //     width: 300,
              //     text: 'Location',
              //     function: () async{
              //       cubit.getPosition(context);
              //       var currentLocation = await cubit.getLatitudeAndLongitude();
              //       // print("Latitude ${currentLocation.altitude}");
              //       // print("Longitude ${currentLocation.longitude}");
              //       List<Placemark> placemarks = await placemarkFromCoordinates(currentLocation.altitude,currentLocation.longitude );
              //       print(placemarks[0].administrativeArea);
              //
              //       //-----------------------------
              //
              //       var distanceBetween = Geolocator.distanceBetween(currentLocation.altitude,currentLocation.longitude , 53.35,  9.6);
              //       var distanceKM = distanceBetween/1000;
              //       print(distanceKM);
              //     }
              // ),
              Expanded(
                child: ConditionalBuilder(
                  condition: cubit.bloodBankValue=="الاسكندريه",
                  builder: (BuildContext context) =>ListView.separated(
                      itemBuilder: (BuildContext context, index)  => BloodBankLocation(BloodBankAlexList[index]),
                      separatorBuilder: (BuildContext context, index)  => SizedBox(height:40),
                      itemCount: BloodBankAlexList.length),
                  fallback: (BuildContext context) => ListView.separated(
                      itemBuilder: (BuildContext context, index)  => BloodBankLocation(BloodBankBihiraList[index]),
                      separatorBuilder: (BuildContext context, index)  => SizedBox(height:40),
                      itemCount: BloodBankBihiraList.length),

                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


Widget BloodBankLocation(BloodBankModel model)=>  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    width: 300,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow:[
          BoxShadow(
            color: HexColor('#EAEAEA'),
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ]
    ),

    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    child: Row(
      children: [
        Image.asset(model.bankIcon),
        SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.bankName,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    " دقيقه ${model.time}  ,  ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),),
                  Expanded(
                    child: Text(
                      "${model.distance} كم  ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  ),
);