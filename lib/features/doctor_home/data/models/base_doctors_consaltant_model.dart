import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/core/enums/consultant_status_enum.dart';

class BaseDoctorsConsaltantModel {
  final List<DoctorConsaltantModel> consaltants;

  BaseDoctorsConsaltantModel({required this.consaltants});
  factory BaseDoctorsConsaltantModel.fromQuerySnapshot(
          List<QueryDocumentSnapshot> data) =>
      BaseDoctorsConsaltantModel(
        consaltants: data
            .map((doctor) => DoctorConsaltantModel.fromQuerySnapshot(
                doctor.data() as Map<String, dynamic>, doctor.id))
            .toList(),
      );

  void deleteConsaltant(String consaltantId) {
    consaltants.removeWhere((element) => element.id == consaltantId);
  }
}

class DoctorConsaltantModel {
  final String id;
  final ConsultantStatusEnum status;
  final String doctorId;
  final DateTime date;
  final String ecgStatusEnum;
  final String medicalCondidion;
  final String patientAge;
  final String patientEmail;
  final String patientImage;
  final String patientName;
  final String? meetingLink;
  final String? time;
  final String? meetingTime;
  final String doctorImage;
  final String doctorName;
  DoctorConsaltantModel({
    required this.status,
    required this.doctorId,
    required this.date,
    this.meetingLink,
    this.time,
    this.meetingTime,
    required this.doctorImage,
    required this.doctorName,
    required this.id,
    required this.ecgStatusEnum,
    required this.medicalCondidion,
    required this.patientAge,
    required this.patientEmail,
    required this.patientImage,
    required this.patientName,
  });

  factory DoctorConsaltantModel.fromQuerySnapshot(
          Map<String, dynamic> data, final String id) =>
      DoctorConsaltantModel(
        status: DeliveryStatusExtension.fromString(data['consultantStatus']),
        doctorId: data['doctorId'],
        date: (data['date'] as Timestamp).toDate(),
        id: id,
        ecgStatusEnum: data['ecgStatusEnum'],
        medicalCondidion: data['medicalCondidion'],
        patientAge: data['patient_age'],
        patientEmail: data['patient_email'],
        patientImage: data['patient_image'],
        time: data['time'],
        meetingLink: data['meetingLink'],
        patientName: data['patient_name'],
        meetingTime: data['meetingTime'],
        doctorImage: data['doctorImage'],
        doctorName: data['doctorName'],
      );
}

extension DeliveryStatusExtension on ConsultantStatusEnum {
  static ConsultantStatusEnum fromString(String value) {
    return ConsultantStatusEnum.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => ConsultantStatusEnum.pending,
    );
  }
}
