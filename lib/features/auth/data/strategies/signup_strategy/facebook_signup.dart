import 'package:medical_app/features/auth/data/strategies/signup_strategy/signup_strategy.dart';
import 'package:medical_app/features/auth/data/models/signup_request_model.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

class FacebookSignup extends SignupStrategy {
  FacebookSignup(super.authService);
  @override
  Future<UserModel> signUp(SignupRequestModel signupRequestModel) async {
    return await authService.signUpWithFacebook(signupRequestModel);
  }
}
