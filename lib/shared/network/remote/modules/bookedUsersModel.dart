import 'package:save_a_life_2024/shared/network/endPoints/end_points.dart';

class BookingUsersModel{
  late String message;
  List<Bookings> bookings = [];

  BookingUsersModel.fromjson(Map<String,dynamic> jsonData){
    message = jsonData[ApiKeys.message];

    final List<dynamic> bookingsList = jsonData['bookings'];
    bookingsList.forEach((element) {
      final booking = Bookings.fromjson(element);
      this.bookings.add(booking);
    });
  }
}

class Bookings{
  String ?user_id ; String ?booking_id; String ?name;
  String ?age; String ?gender; String ?bloodtype;
  String ?date; String ?time; String ?book_status;


  Bookings.fromjson(Map<String,dynamic> jsonData){
    user_id= jsonData[ApiKeys.user_id].toString();
    booking_id= jsonData[ApiKeys.booking_id].toString();
    name= jsonData[ApiKeys.name];
    age= jsonData[ApiKeys.age].toString();
    gender= jsonData[ApiKeys.gender];
    bloodtype=jsonData[ApiKeys.bloodtype];
    date= jsonData[ApiKeys.date];
    time= jsonData[ApiKeys.time];
    book_status= jsonData[ApiKeys.book_status];
  }
}
