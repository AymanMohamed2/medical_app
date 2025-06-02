import 'package:medical_app/features/auth/data/datasources/remote_data_source/base_auth_remote_datasource.dart';
import 'package:medical_app/features/auth/data/models/login_request_model.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

abstract class LoginStrategy {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSoucrce;

  LoginStrategy(this.baseAuthRemoteDataSoucrce);
  Future<UserModel> login(LoginRequestModel loginRequestModel);
}
