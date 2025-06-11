import 'dart:convert';

class BasePbmModel {
  final String bpm;

  BasePbmModel({required this.bpm});

  factory BasePbmModel.fromJson(List json) {
    final rawString = json[0];
    final validJsonString = rawString.replaceAll("'", '"');
    final List<dynamic> parsedList = jsonDecode(validJsonString);
    final bpmValue = parsedList[0]['bpm'];
    return BasePbmModel(bpm: bpmValue);
  }
}
