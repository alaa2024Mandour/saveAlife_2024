
class SignInModel {
  dynamic? token;
  String? tokenType;
  String? error;
  int? expiresIn;
  User? user;

  SignInModel({this.token, this.tokenType, this.expiresIn, this.user});

  SignInModel.fromJson(Map<dynamic, dynamic> json) {
    token = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    error = json['error'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['access_token'] = this.token;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['error'] = this.error;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? avatar;
  String? birthday;
  String? city;
  String? address;
  String? phone;
  String? bloodtype;
  String? gender;
  String? email;
  Null? emailVerifiedAt;
  String? numOfDonates;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  User(
      {this.id,
        this.name,
        this.avatar,
        this.birthday,
        this.city,
        this.address,
        this.phone,
        this.bloodtype,
        this.gender,
        this.email,
        this.emailVerifiedAt,
        this.numOfDonates,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    birthday = json['birthday'];
    city = json['city'];
    address = json['address'];
    phone = json['phone'];
    bloodtype = json['bloodtype'];
    gender = json['gender'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    numOfDonates = json['num_of_donates'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['birthday'] = this.birthday;
    data['city'] = this.city;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['bloodtype'] = this.bloodtype;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['num_of_donates'] = this.numOfDonates;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
//
// import 'package:save_a_life_2024/shared/network/endPoints/end_points.dart';
//
// class SignInModel {
//  String token = '';
//  Users? user;
//
//
//  SignInModel.fromJson(Map<String,dynamic> signInJson){
//    token = signInJson[ApiKeys.token];
//    user = signInJson['user'] != null ? new Users.fromJson(signInJson['user']) : null;
//    // final List<dynamic> UsersList = datajson['user'];
//    // UsersList.forEach((element){
//    //   final user = Users.fromJson(element);
//    //   this.users.add(user);
//    // });
//  }
// }
//
//
// class Users {
//   String name;
//   String birthday;
//   String address;
//   String city;
//   String phone;
//   String bloodType;
//   String gender;
//   String email;
//   String num_of_donates;
//
//   Users(
//       {
//         required this.name,
//         required this.birthday,
//         required this.city,
//         required this.address,
//         required this.phone,
//         required this.bloodType,
//         required this.gender,
//         required this.email,
//         required this.num_of_donates,
//       }
//       );
//
//   factory Users.fromJson(Map<String,dynamic> signInJson) => Users(
//     name: signInJson[ApiKeys.name],
//     birthday: signInJson[ApiKeys.birthday],
//     city: signInJson[ApiKeys.city],
//     address: signInJson[ApiKeys.government],
//     phone:signInJson[ApiKeys.phone],
//     bloodType:signInJson[ApiKeys.bloodtype],
//     gender:signInJson[ApiKeys.gender],
//     email: signInJson[ApiKeys.email],
//     num_of_donates: signInJson['num_of_donates'],
//   );
// }