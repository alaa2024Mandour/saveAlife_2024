
import '../../endPoints/end_points.dart';

class SignUpModel {
   String name;String birthday;String city;String address;String phone;String bloodType;
   String gender;String email;String password;String password_confirmation; String avatar;String message;

  SignUpModel(
   {
     required this.name,
     required this.birthday,
     required this.city,
     required this.address,
     required this.phone,
     required this.bloodType,
     required this.gender,
     required this.email,
     required this.password,
     required this.password_confirmation,
     required this.avatar,
     required this.message,
}
);

  factory SignUpModel.fromJson(Map<String,dynamic> signUpJson) => SignUpModel(
    name: signUpJson[ApiKeys.name],
    birthday: signUpJson[ApiKeys.birthday],
    city: signUpJson[ApiKeys.city],
    address: signUpJson[ApiKeys.government],
    phone:signUpJson[ApiKeys.phone],
    bloodType:signUpJson[ApiKeys.bloodtype],
    gender:signUpJson[ApiKeys.gender],
    email: signUpJson[ApiKeys.email],
    password: signUpJson[ApiKeys.password],
    password_confirmation:signUpJson[ApiKeys.confirmPassword],
    avatar: signUpJson[ApiKeys.avatar],
    message: signUpJson[ApiKeys.message],
  );
}