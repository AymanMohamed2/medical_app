import 'package:medical_app/features/auth/data/models/signup_request_model.dart';

abstract class BaseAuthRemoteDataSource<returnType, param> {
  Future<returnType> signUpWithEmailPassword(
      SignupRequestModel signupRequestModel);
  Future<returnType> signUpWithGoogle(param signupRequestModel);
  Future<returnType> signUpWithFacebook(param signupRequestModel);
}
