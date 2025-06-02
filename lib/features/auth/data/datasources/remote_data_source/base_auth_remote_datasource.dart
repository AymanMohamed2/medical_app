import 'package:medical_app/features/auth/data/models/login_request_model.dart';
import 'package:medical_app/features/auth/data/models/signup_request_model.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

abstract class BaseAuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword(
      SignupRequestModel signupRequestModel);
  Future<UserModel> signUpWithGoogle(SignupRequestModel signupRequestModel);
  Future<UserModel> signUpWithFacebook(SignupRequestModel signupRequestModel);

  Future<UserModel> loginWithEmailAndPassword(
      LoginRequestModel loginRequestModel);
  Future<UserModel> loginWithGoogle(LoginRequestModel loginRequestModel);
  Future<UserModel> loginWithFacebook(LoginRequestModel loginRequestModel);
}
