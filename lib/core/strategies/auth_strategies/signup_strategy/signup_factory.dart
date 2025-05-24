import 'package:medical_app/core/enums/signup_method_enum.dart';
import 'package:medical_app/features/auth/data/datasources/remote_data_source/base_auth_remote_datasource.dart';
import 'package:medical_app/core/strategies/auth_strategies/signup_strategy/email_signup.dart';
import 'package:medical_app/core/strategies/auth_strategies/signup_strategy/facebook_signup.dart';
import 'package:medical_app/core/strategies/auth_strategies/signup_strategy/google_signup.dart';
import 'package:medical_app/core/strategies/auth_strategies/signup_strategy/signup_strategy.dart';
import 'package:medical_app/features/auth/data/models/signup_request_model.dart';

class SignupFactory {
  static SignupStrategy create(SignupRequestModel signupRequestModel,
      BaseAuthRemoteDataSource authService) {
    switch (signupRequestModel.signupMethod) {
      case AuthMethodEnum.email:
        return EmailSignup(authService);
      case AuthMethodEnum.facebook:
        return FacebookSignup(authService);
      case AuthMethodEnum.google:
        return GoogleSignup(authService);
      // ignore: unreachable_switch_default
      default:
        return throw Exception('Invalid signup method');
    }
  }
}
