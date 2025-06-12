import 'package:dartz/dartz.dart';
import 'package:medical_app/core/entities/message_entity.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/models/send_message_request_model/send_message_request_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, MessageEntity>> sendMessage(
      SendMessageRequestModel sendMessageRequestModel);
}
