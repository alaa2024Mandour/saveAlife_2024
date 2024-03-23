import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_a_life_2024/user_layouts/user_cubit/userSubit.dart';
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

  late String Title;
  late String Item1;
  late String Item2;

  void citySearch(String title , String value){
    Title = value;
    emit(UserCitySearchState());
  }
}