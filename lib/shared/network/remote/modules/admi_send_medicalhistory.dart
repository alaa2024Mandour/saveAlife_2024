import '../../endPoints/end_points.dart';

class AdminSendData {
  int ?user_id;String ?report_link;

  AdminSendData(
      {
        required this.report_link,
        required this.user_id,
      }
      );

  factory AdminSendData.fromJson(Map<String,dynamic> adminSendJson) => AdminSendData(
    report_link: adminSendJson[ApiKeys.report_link],
    user_id: adminSendJson[ApiKeys.user_id],
  );
}