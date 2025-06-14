import 'package:medical_app/features/auth/data/models/complete_data_request_model.dart';

class EditMedicalRecordRequestModel extends CompleteDataRequestModel {
  final String medicalRecord;

  EditMedicalRecordRequestModel({required this.medicalRecord});

  @override
  Map<String, dynamic> toJson() {
    return {'medicalCondidion': medicalRecord};
  }
}
