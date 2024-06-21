import 'package:save_a_life_2024/shared/network/endPoints/end_points.dart';

class DonorsModel{
  late String message;
  List<Donors> donors = [];

  DonorsModel.fromjson(Map<String,dynamic> jsonData){
    message = jsonData[ApiKeys.message];
    final List<dynamic> bookingsList = jsonData['donors'];
    bookingsList.forEach((element) {
      final donor = Donors.fromjson(element);
      this.donors.add(donor);
    });}}

class Donors{
  String ?user_id ; String ?booking_id; String ?name;
  String ?age; String ?gender; String ?bloodtype;
  String ?date; String ?time; String ?book_status;

  Donors.fromjson(Map<String,dynamic> jsonData){
    user_id= jsonData[ApiKeys.user_id].toString();
    booking_id= jsonData[ApiKeys.booking_id].toString();
    name= jsonData[ApiKeys.name];
    age= jsonData[ApiKeys.age].toString();
    gender= jsonData[ApiKeys.gender];
    bloodtype=jsonData[ApiKeys.bloodtype];
    date= jsonData[ApiKeys.date];
    time= jsonData[ApiKeys.time];
    book_status= jsonData[ApiKeys.book_status];}}
