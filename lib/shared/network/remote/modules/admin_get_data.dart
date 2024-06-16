import 'package:save_a_life_2024/shared/network/endPoints/end_points.dart';

class AdminModel{
  int id;
  String name;
  String email;
  String phone;


  AdminModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email
  });

  factory AdminModel.fromjson(Map<String,dynamic> jsonData){
    return AdminModel(
      id: jsonData[ApiKeys.id],
      name: jsonData[ApiKeys.name],
      phone: jsonData[ApiKeys.phone],
      email: jsonData[ApiKeys.email],
    );
  }
}