import '../../endPoints/end_points.dart';

class AdminSignInModel {
  /*int  id;*/String ?name;String ?phone;String ?email;String token;

  AdminSignInModel(
  {
  required this.token,
  // required this.id,
  required this.name,
  required this.phone,
  required this.email,
  }
  );

  factory AdminSignInModel.fromJson(Map<String,dynamic> adminSignInJson) => AdminSignInModel(
  token: adminSignInJson[ApiKeys.token],
  // id: signInJson[ApiKeys.id],
  name: adminSignInJson[ApiKeys.name],
  phone:adminSignInJson[ApiKeys.phone],
  email: adminSignInJson[ApiKeys.email],
  );
  }
