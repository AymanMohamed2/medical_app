import 'dart:convert';

import 'package:medical_app/features/patient_home/data/models/patient_vitals_model/heart_signal_model.dart';

class BasePatientVitalsModel {
  final String bodyTemperature;
  final String bloodO2Level;
  final String readingsDate;
  final HeartSignalModel heartSignal;
  final List<String> p;
  final List<String> qrs;
  final String? qPeak;
  final String? sPeak;
  final List<String> t;
  final List<String> r;

  BasePatientVitalsModel({
    required this.bodyTemperature,
    required this.bloodO2Level,
    required this.readingsDate,
    required this.p,
    required this.qrs,
    required this.qPeak,
    required this.sPeak,
    required this.t,
    required this.r,
    required this.heartSignal,
  });

  factory BasePatientVitalsModel.fromJson(List<dynamic> json) {
    final rawString = json[0];
    final validJson = rawString.replaceAll("'", '"');
    final List<dynamic> parsedList = jsonDecode(validJson);

    final readingsDate = parsedList[0]['readings_date'];
    final rawHeart = Map<String, dynamic>.from(parsedList[1]);
    final heartSignalRaw = _normalizeKeys(rawHeart);

    final bodyTemp = parsedList[2]['body_temprature'].toString().trim();
    final bloodO2 = parsedList[2]['blood_o2_level'].toString().trim();

    return BasePatientVitalsModel(
      readingsDate: readingsDate,
      heartSignal: HeartSignalModel(
        heartSignal: _parseList(heartSignalRaw['heart_signal']),
      ),
      p: _parseList(heartSignalRaw['P']),
      qrs: _parseList(heartSignalRaw['QRS']),
      qPeak: heartSignalRaw['Qpeak']?.toString().trim(),
      sPeak: heartSignalRaw['Speak']?.toString().trim(),
      t: _parseList(heartSignalRaw['T']),
      r: _parseList(heartSignalRaw['R']),
      bodyTemperature: bodyTemp,
      bloodO2Level: bloodO2,
    );
  }

  static List<String> _parseList(dynamic value) {
    if (value is List) {
      return List<String>.from(value.map((e) => e.toString().trim()));
    } else if (value is String && value.startsWith('[')) {
      try {
        final parsed = jsonDecode(value.replaceAll("'", '"'));
        return List<String>.from(parsed.map((e) => e.toString().trim()));
      } catch (e) {
        return [value.trim()];
      }
    } else if (value != null) {
      return [value.toString().trim()];
    } else {
      return [];
    }
  }

  static Map<String, dynamic> _normalizeKeys(Map<String, dynamic> raw) {
    return raw.map((key, value) {
      final newKey = key.toString().replaceAll(RegExp(r'\s+'), '');
      return MapEntry(newKey, value);
    });
  }
}
