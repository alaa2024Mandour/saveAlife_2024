import 'package:save_a_life_2024/shared/network/endPoints/end_points.dart';

class UserModel{
  int id;
  String name;
  String email;
  String avatar;
  String city;
  String address;
  String phone;
  String bloodtype;
  String gender;

  UserModel({
    required this.id,
  required this.name,
  required this.address,
  required this.avatar,
  required this.bloodtype,
  required this.city,
  required this.gender,
  required this.phone,
  required this.email
  });

  factory UserModel.fromjson(Map<String,dynamic> jsonData){
  return UserModel(
  id: jsonData[ApiKeys.id],
  name: jsonData[ApiKeys.name],
  address: jsonData[ApiKeys.government],
  avatar: jsonData[ApiKeys.avatar],
  bloodtype: jsonData[ApiKeys.bloodtype],
  city: jsonData[ApiKeys.city],
  gender: jsonData[ApiKeys.gender],
  phone: jsonData[ApiKeys.phone],
  email: jsonData[ApiKeys.email],
  );
  }
}