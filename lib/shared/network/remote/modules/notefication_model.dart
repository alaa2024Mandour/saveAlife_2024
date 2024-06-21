 import 'package:save_a_life_2024/shared/network/endPoints/end_points.dart';

class NotificationModel{
  List<Notifications> notification = [];

  NotificationModel.fromjson(Map<String,dynamic> jsonData){
    final List<dynamic> notificationList = jsonData['notifications'];
    notificationList.forEach((element) {
      final notification = Notifications.fromjson(element);
      this.notification.add(notification);
    });
  }
 }


 class Notifications{
   String ?id ;
   String ?report_link;

    Notifications.fromjson(Map<String,dynamic> jsonData){

      id= jsonData[ApiKeys.id];
      report_link= jsonData[ApiKeys.report_link];
   }
 }


























// import 'package:save_a_life_2024/shared/network/endPoints/end_points.dart';
 // class NotificationModel {
 //   List<Notifications>? notifications;
 //
 //   NotificationModel({this.notifications});
 //
 //   NotificationModel.fromJson(Map<String, dynamic> json) {
 //     if (json['notifications'] != null) {
 //       notifications =  json['notifications'];
 //       json['notifications'].forEach((v) {
 //         notifications!.add(new Notifications.fromJson(v));
 //       });
 //     }
 //   }
 //
 //   Map<String, dynamic> toJson() {
 //     final Map<String, dynamic> data = new Map<String, dynamic>();
 //     if (this.notifications != null) {
 //       data['notifications'] =
 //           this.notifications!.map((v) => v.toJson()).toList();
 //     }
 //     return data;
 //   }
 // }
 //
 // class Notifications {
 //   String? id;
 //   String? reportLink;
 //
 //   Notifications({this.id, this.reportLink});
 //
 //   Notifications.fromJson(Map<String, dynamic> json) {
 //     id = json['id'];
 //     reportLink = json['report_link'];
 //   }
 //
 //   Map<String, dynamic> toJson() {
 //     final Map<String, dynamic> data = new Map<String, dynamic>();
 //     data['id'] = this.id;
 //     data['report_link'] = this.reportLink;
 //     return data;
 //   }
 // }
 //

//
// class NotificationModel{
//   List<Notification> notifications;
//
//   NotificationModel({
//     required this.notifications,
//   });
//
//   factory NotificationModel.fromjson(Map<String,dynamic> jsonData){
//     return NotificationModel(
//         notifications: jsonData['notifications']
//     );
//   }
// }
//
//
// class Notification {
//   String id;
//   String reportLink;
//
//   Notification({
//     required this.id,
//     required this.reportLink,
//   });
//   factory Notification.fromjson(Map<String,dynamic> jsonData){
//     return Notification(
//       reportLink: jsonData[ApiKeys.report_link],
//       id: jsonData[ApiKeys.id],
//     );
//   }
// }