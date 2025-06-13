import 'package:medical_app/core/enums/consultant_status_enum.dart';

class FetchConsultDoctorRequestModel {
  final String doctorId;
  final ConsultantStatusEnum status;
  FetchConsultDoctorRequestModel(
      {required this.doctorId, required this.status});
}
