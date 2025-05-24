import 'package:medical_app/features/auth/data/models/login_request_model.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';
import 'package:medical_app/core/strategies/auth_strategies/login_strategy/login_strategy.dart';

class LoginWithGoogle extends LoginStrategy {
  LoginWithGoogle(super.baseAuthRemoteDataSoucrce);

  @override
  Future<UserModel> login(LoginRequestModel loginRequestModel) async {
    return await baseAuthRemoteDataSoucrce.loginWithGoogle(loginRequestModel);
  }
}
