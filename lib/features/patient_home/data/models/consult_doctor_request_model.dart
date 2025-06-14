import 'package:medical_app/core/enums/consultant_status_enum.dart';
import 'package:medical_app/core/enums/ecg_status_enum.dart';
import 'package:medical_app/core/utils/get_user_data.dart';

class ConsultDoctorRequestModel {
  final String doctorId;
  final String date;
  final EcgStatusEnum ecgStatusEnum;
  final String doctorImage;
  final String doctorName;
  final ConsultantStatusEnum consultantStatus;

  ConsultDoctorRequestModel({
    required this.doctorId,
    required this.consultantStatus,
    required this.date,
    required this.doctorImage,
    required this.doctorName,
    required this.ecgStatusEnum,
  });
  Map<String, dynamic> toJson() => {
        'patient_name': GetUserData.user!.name,
        'patient_age': GetUserData.user!.age,
        'patient_email': GetUserData.user!.email,
        'patient_image': GetUserData.user!.image,
        'doctorId': doctorId,
        'date': date,
        'ecgStatusEnum': ecgStatusEnum.name,
        'medicalCondidion': GetUserData.user!.medicalCondidion,
        'consultantStatus': consultantStatus.name,
        'meetingLink': '',
        'time': DateTime.now(),
        'meetingTime': '',
        'doctorImage': doctorImage,
        'doctorName': doctorName
      };
}
