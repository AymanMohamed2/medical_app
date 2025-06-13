import 'package:medical_app/core/constants/api_constance.dart';

class ApiUrls {
  static const String pbmUrl = '${ApiConstance.apiBaseUrl}beat_per_min';
  static const String ecgUrl = '${ApiConstance.apiBaseUrl}ECG_reading';
  static const String aiUrl = '${ApiConstance.apiBaseUrl}Ai/receive_ai_text';
  static const String patientVitalsUrl =
      '${ApiConstance.apiBaseUrl}patient_vitals/';
}
