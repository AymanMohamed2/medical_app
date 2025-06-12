import 'package:dartz/dartz.dart';
import 'package:medical_app/core/entities/message_entity.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:medical_app/features/chat/domain/repositories/home_repository.dart';

class SendMessageUseCase {
  final HomeRepository homeRepository;

  SendMessageUseCase(this.homeRepository);

  Future<Either<Failure, MessageEntity>> execute(
      SendMessageRequestModel sendMessageRequestModel) {
    return homeRepository.sendMessage(sendMessageRequestModel);
  }
}
