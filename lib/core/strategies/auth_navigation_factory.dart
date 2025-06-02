import 'package:medical_app/core/enums/signup_method_enum.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';
import 'package:medical_app/core/strategies/auth_navigation_strategy.dart';
import 'package:medical_app/core/strategies/email_password_navigation.dart';
import 'package:medical_app/core/strategies/facebook_navigation.dart';
import 'package:medical_app/core/strategies/google_navigation.dart';

class AuthNavigationFactory {
  static AuthNavigationStrategy create(UserModel user) {
    switch (user.signupMethod) {
      case AuthMethodEnum.email:
        return EmailPasswordNavigation(user);
      case AuthMethodEnum.facebook:
        return FacebookNavigation(user);
      case AuthMethodEnum.google:
        return GoogleNavigation(user);
      default:
        throw Exception('Auth Navigation Strategy Not Found!');
    }
  }
}
