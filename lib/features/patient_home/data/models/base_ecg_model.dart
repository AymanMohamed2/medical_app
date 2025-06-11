import 'dart:convert';

import 'package:medical_app/core/enums/ecg_status_enum.dart';

class BaseEcgModel {
  final EcgStatusEnum ecgStatusEnum;

  BaseEcgModel({required this.ecgStatusEnum});

  factory BaseEcgModel.fromJson(List<dynamic> json) {
    final rawString = json[0];
    final validJsonString = rawString.replaceAll("'", '"');
    final List<dynamic> parsedList = jsonDecode(validJsonString);
    final bpmValue = parsedList[0]['ecg1_reading'];
    return BaseEcgModel(ecgStatusEnum: EcgStatusEnum.fromString(bpmValue));
  }
}
