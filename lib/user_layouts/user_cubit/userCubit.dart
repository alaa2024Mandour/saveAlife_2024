import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    Appointment(),
    UserHome(),
    SharingApp(),
    UserProfile(),
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
Future getPosition() async {
    bool services;
    services = await Geolocator.isLocationServiceEnabled();
    print(services);
    emit(UserLocationStatus());
}


}