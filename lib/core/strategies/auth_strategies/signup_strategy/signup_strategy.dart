import 'package:medical_app/features/auth/data/datasources/remote_data_source/base_auth_remote_datasource.dart';
import 'package:medical_app/features/auth/data/models/signup_request_model.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

abstract class SignupStrategy {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSoucrce;

  SignupStrategy(this.baseAuthRemoteDataSoucrce);
  Future<UserModel> signUp(SignupRequestModel signupRequestModel);
}
