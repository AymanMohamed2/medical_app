import 'package:medical_app/core/constants/api_constance.dart';

abstract class ApiUrls {
  static String loginUrl =
      '${ApiConstance.appwriteBaseUrl}account/sessions/phone';
  static String apiLoginUrl = '${ApiConstance.apiBaseUrl}register-user/';
}
