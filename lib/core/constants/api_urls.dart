import 'package:medical_app/core/constants/api_constance.dart';

class ApiUrls {
  static const String pbmUrl = '${ApiConstance.apiBaseUrl}beat_per_min';
  static const String ecgUrl = '${ApiConstance.apiBaseUrl}ECG_reading';
  static const String patientVitalsUrl =
      '${ApiConstance.apiBaseUrl}patient_vitals/day/1/hour/1';
}
