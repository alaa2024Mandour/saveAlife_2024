import 'package:save_a_life_2024/shared/network/endPoints/end_points.dart';

class SearchModel{
  late String message;
  List<DonorsSearch> donors = [];

  SearchModel.fromjson(Map<String,dynamic> jsonData){
    message = jsonData[ApiKeys.message];
    final List<dynamic> bookingsList = jsonData['donors'];
    bookingsList.forEach((element) {
      final donor = DonorsSearch.fromjson(element);
      this.donors.add(donor);
    });}}

class DonorsSearch{
  String ?user_id ; String ?name;
  String ?age; String ?gender; String ?bloodtype;
  String ?last_donate_date;

  DonorsSearch.fromjson(Map<String,dynamic> jsonData){
    user_id= jsonData[ApiKeys.user_id].toString();
    name= jsonData[ApiKeys.name];
    age= jsonData[ApiKeys.age].toString();
    gender= jsonData[ApiKeys.gender];
    bloodtype=jsonData[ApiKeys.bloodtype];
    last_donate_date= jsonData["last_donates"];
  }
}
