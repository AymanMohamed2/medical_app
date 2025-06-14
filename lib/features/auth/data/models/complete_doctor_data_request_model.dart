import 'package:medical_app/features/auth/data/models/complete_data_request_model.dart';

class CompleteDoctorDataRequestModel extends CompleteDataRequestModel {
  final bool isCompeleteData;

  CompleteDoctorDataRequestModel({this.isCompeleteData = true});

  @override
  Map<String, dynamic> toJson() {
    return {'isCompeleteData': isCompeleteData};
  }
}
