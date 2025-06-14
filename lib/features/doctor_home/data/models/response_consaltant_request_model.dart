import 'package:medical_app/core/enums/consultant_status_enum.dart';

class ResponseConsaltantRequestModel {
  ConsultantStatusEnum? status;
  String? meetingLink;
  DateTime? date;
  String? time;
  String? id;

  ResponseConsaltantRequestModel({
    this.status,
    this.meetingLink,
    this.date,
    this.id,
    this.time,
  });

  toJson() => {
        'consultantStatus': status!.name,
        'meetingLink': meetingLink,
        'date': date,
        'meetingTime': time
      };
}
