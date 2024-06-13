// import 'dart:convert';
//
// import 'package:http/http.dart';
// class API {
//   static const String baseURL = 'http://127.0.0.1:8000/api';
//   static Future<Response> createAcount (
//       String name,
//       String birthday,
//       String city,
//       String address,
//       String phone,
//       String bloodType,
//       String gender,
//       String email,
//       String password,
//       String password_confirmation,
//       ) async {
//     final Response response = await
//     post('$baseURL/auth/register' as Uri,
//       body: jsonEncode(<String,dynamic>{
//         'name':name,
//         'birthday':birthday,
//         'city':city,
//         'address':address,
//         'phone':phone,
//         'bloodtype':bloodType,
//         'gender':gender,
//         'email':email,
//         'password':password,
//         'password_confirmation':password_confirmation,
//       })
//     ) ;
//
//     if (response.statusCode == 200 ){
//       print(response.body);
//     }else{
//       print("Error");
//     }
//     return response;
//   }
// }