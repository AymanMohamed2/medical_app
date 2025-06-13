import 'package:medical_app/core/constants/api_urls.dart';
import 'package:medical_app/core/entities/message_entity.dart';
import 'package:medical_app/core/models/message_model/message_model.dart';
import 'package:medical_app/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:medical_app/core/networking/api_service.dart';

class GeminiServices {
  final ApiService apiService;

  GeminiServices(this.apiService);
  Future<MessageEntity> sendMessage(
      SendMessageRequestModel sendMessageRequestModel) async {
    var result = await apiService.post(
        url: ApiUrls.aiUrl, data: sendMessageRequestModel.toJson());

    return MessageModel.fromJson(result.data);
  }
}
