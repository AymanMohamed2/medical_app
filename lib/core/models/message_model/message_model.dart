import 'package:medical_app/core/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({required super.message, super.isUserMessage = false});

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      MessageModel(message: json['AI_response']);
}
