import 'package:medical_app/core/entities/message_entity.dart';
import 'package:medical_app/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:medical_app/core/services/gemini_services.dart';
import 'package:medical_app/features/chat/data/datasources/base_home_data_source.dart';

class RemoteDataSource extends BaseHomeDataSource {
  final GeminiServices geminiServices;

  RemoteDataSource(this.geminiServices);
  @override
  Future<MessageEntity> sendMessage(
      SendMessageRequestModel sendMessageRequestModel) async {
    return geminiServices.sendMessage(sendMessageRequestModel);
  }
}
