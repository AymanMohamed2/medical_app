import 'package:medical_app/core/enums/signup_method_enum.dart';
import 'package:medical_app/core/strategies/auth_strategies/login_strategy/login_strategy.dart';
import 'package:medical_app/core/strategies/auth_strategies/login_strategy/login_with_email_password_strategy.dart';
import 'package:medical_app/core/strategies/auth_strategies/login_strategy/login_with_facebook.dart';
import 'package:medical_app/core/strategies/auth_strategies/login_strategy/login_with_google.dart';
import 'package:medical_app/features/auth/data/datasources/remote_data_source/base_auth_remote_datasource.dart';

class LoginStrategyFactory {
  final BaseAuthRemoteDataSource authRemoteDataSource;
  LoginStrategyFactory(this.authRemoteDataSource);
  LoginStrategy create(AuthMethodEnum signupMethod) {
    switch (signupMethod) {
      case AuthMethodEnum.email:
        return LoginWithEmailPasswordStrategy(authRemoteDataSource);
      case AuthMethodEnum.google:
        return LoginWithGoogle(authRemoteDataSource);
      case AuthMethodEnum.facebook:
        return LoginWithFacebook(authRemoteDataSource);
    }
  }
}
