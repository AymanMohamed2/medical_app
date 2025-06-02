import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/features/patient_home/data/models/doctors_model/doctor_model.dart';

class BaseDoctorsModel {
  final List<DoctorModel> doctors;

  BaseDoctorsModel({required this.doctors});

  factory BaseDoctorsModel.fromJson(Map<String, dynamic> json) =>
      BaseDoctorsModel(
        doctors: (json["doctors"] as List<dynamic>)
            .map((doctor) => DoctorModel.fromJson(doctor))
            .toList(),
      );

  factory BaseDoctorsModel.fromQuerySnapshot(
          List<QueryDocumentSnapshot> data) =>
      BaseDoctorsModel(
        doctors: data
            .map((doctor) =>
                DoctorModel.fromJson(doctor.data() as Map<String, dynamic>))
            .toList(),
      );
}
