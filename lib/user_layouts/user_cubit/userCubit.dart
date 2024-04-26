import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:save_a_life_2024/user_layouts/user_cubit/userStatus.dart';
import '../appointment/appointment.dart';
import '../home_page/userHome.dart';
import '../nearst_blood_bank/nearst_blood_bank.dart';
import '../profile_setting/profile.dart';
import '../sharingApp/share.dart';

class UserCubit extends Cubit<UserStatus> {
  UserCubit() : super(UserInitState());

  static UserCubit get(context) => BlocProvider.of(context);

  int currentIndex = 2;

  List<Widget> bottomScreen = [
    NearestBank(),
    const Appointment(),
     UserHome(),
    const SharingApp(),
    const UserProfile(),
  ];

  void changeNavBottom(int index) {
    currentIndex = index;
    emit(UserChangeBottomNavState());
  }
  //---------Choose Gender--------------
  String Gender = "ذكر";
  void ChooseGender( String value){
    Gender = value;
    emit(UserGenderState());
    print(Gender);
  }

  //---------City Search--------------
  final List<String> donorCityitems = [
    'البحث عن متبرعين في محافظه',
    'الاسكندريه',
    'البحيره',
  ];
  String donorCityMenuValue = 'البحث عن متبرعين في محافظه';
  void donorCityMenu(String value){
    donorCityMenuValue = value;
    emit(DonorCityState());
  }

  final List<String> bloodBanktems = [
    'الاسكندريه',
    'البحيره',
  ];
  String bloodBankValue = 'الاسكندريه';
  void bloodBankMenu(String value){
    bloodBankValue = value;
    emit(DonorCityState());
  }

  //---------Choose blood type--------------

  final List<String> items = [
    '+A',
    '-A',
    '+AB',
    '-AB',
    '+B',
    '-B',
    '+O',
    '-O',
  ];
  String dropdownBloodMenuValue = '+A';
  void BloodTypeMenu(String value){
    dropdownBloodMenuValue = value;
    emit(UserBloodTypeState());
  }

  //===========password login form =============
  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffixIcon=isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(UserChangePassStatus());
  }

//=========== Nearest blood bank =============
//------------- open location ---------------
Future getPosition(context) async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    print(services);
    if(!services){
       AwesomeDialog(
          context: context,
          title: "Services",
          body: Text ("Services Not Enable"),
      ).show();
    }

    per = await Geolocator.checkPermission();

    if(per == LocationPermission.denied){
      per = await Geolocator.requestPermission();
      if(per == LocationPermission.whileInUse || per == LocationPermission.always ){
        getLatitudeAndLongitude();
       }
    }
    print(per);
    emit(UserLocationStatus());
}

 Future<Position> getLatitudeAndLongitude() async{
     return await Geolocator.getCurrentPosition().then((value) => value);
 }
 var KomEdekaLat = 53.35;
  var KomEdekaLong = 9.6;
  var ElHelalaLat = 53.4833;
  var ElHelalaLong = 10.3667;
  var ElshatbyaLat = 55.5833;
  var ElshatbyLong = 12.95;
  Future <dynamic> getDistance (lat,long) async{
    var currentLocation = await getLatitudeAndLongitude();
    // print("Latitude ${currentLocation.altitude}");
    // print("Longitude ${currentLocation.longitude}");
    List<Placemark> placemarks = await placemarkFromCoordinates(currentLocation.altitude,currentLocation.longitude );
    print(placemarks[0].administrativeArea);

    //-----------------------------
    var distanceBetween = Geolocator.distanceBetween(currentLocation.altitude,currentLocation.longitude , lat,  long);
    dynamic distanceKM = distanceBetween/1000;
    print(distanceKM);
    return distanceKM;
  }
}