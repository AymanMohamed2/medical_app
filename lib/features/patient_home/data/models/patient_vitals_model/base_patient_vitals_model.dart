import 'dart:convert';

import 'package:medical_app/features/patient_home/data/models/patient_vitals_model/heart_signal_model.dart';

class BasePatientVitalsModel {
  final String bodyTemperature;
  final String bloodO2Level;
  final String readingsDate;
  final HeartSignalModel heartSignal;
  BasePatientVitalsModel(
      {required this.bodyTemperature,
      required this.bloodO2Level,
      required this.readingsDate,
      required this.heartSignal});
  factory BasePatientVitalsModel.fromJson(List<dynamic> json) {
    final rawString = json[0];
    final validJson = rawString.replaceAll("'", '"');
    final List<dynamic> parsedList = jsonDecode(validJson);
    final String readingsDate = parsedList[0]['readings_date'];
    final Map<String, dynamic> heartSignal =
        Map<String, dynamic>.from(parsedList[1]);
    final String bodyTemp = parsedList[2]['body_temprature'].toString().trim();
    final String bloodO2 = parsedList[2]['blood_o2_level'].toString().trim();

    return BasePatientVitalsModel(
      readingsDate: readingsDate,
      heartSignal: HeartSignalModel.fromJson(heartSignal),
      bodyTemperature: bodyTemp,
      bloodO2Level: bloodO2,
    );
  }
}
