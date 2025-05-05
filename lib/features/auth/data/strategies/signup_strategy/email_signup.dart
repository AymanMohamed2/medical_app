import 'package:medical_app/features/auth/data/strategies/signup_strategy/signup_strategy.dart';
import 'package:medical_app/features/auth/data/models/signup_request_model.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

class EmailSignup extends SignupStrategy {
  EmailSignup(super.authService);
  @override
  Future<UserModel> signUp(SignupRequestModel signupRequestModel) async {
    return await authService.signUpWithEmailPassword(signupRequestModel);
  }
}
