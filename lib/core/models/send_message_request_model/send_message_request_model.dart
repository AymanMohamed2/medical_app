import 'dart:developer';

class SendMessageRequestModel {
  final String message;

  SendMessageRequestModel({required this.message});

  Map<String, dynamic> toJson() {
    log(message);
    return {"input": message};
  }
}
