
import 'package:save_a_life_2024/shared/network/endPoints/end_points.dart';

class SignInModel {
  /*int  id;*/String ?name;String? birthday;String ?city;String? address;String ?phone;String ?bloodType;
  String? gender;String ?email;String token;

  SignInModel(
      {
        required this.token,
        // required this.id,
        required this.name,
        required this.birthday,
        required this.city,
        required this.address,
        required this.phone,
        required this.bloodType,
        required this.gender,
        required this.email,
      }
      );

  factory SignInModel.fromJson(Map<String,dynamic> signInJson) => SignInModel(
    token: signInJson[ApiKeys.token],
  // id: signInJson[ApiKeys.id],
  name: signInJson[ApiKeys.name],
  birthday: signInJson[ApiKeys.birthday],
  city: signInJson[ApiKeys.city],
  address: signInJson[ApiKeys.address],
  phone:signInJson[ApiKeys.phone],
  bloodType:signInJson[ApiKeys.bloodtype],
  gender:signInJson[ApiKeys.gender],
  email: signInJson[ApiKeys.email],
  );
}