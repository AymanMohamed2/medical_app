import 'package:medical_app/features/auth/data/models/complete_data_request_model.dart';

class CompletePatientDataRequestModel extends CompleteDataRequestModel {
  final bool isCompeleteData;
  final String age;
  final String medicalCondidion;

  CompletePatientDataRequestModel(
      {this.isCompeleteData = true,
      required this.age,
      required this.medicalCondidion});
  @override
  Map<String, dynamic> toJson() {
    return {
      'isCompeleteData': isCompeleteData,
      'age': age,
      'medicalCondidion': medicalCondidion
    };
  }
}
