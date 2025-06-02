import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/enums/signup_method_enum.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/auth/data/models/login_request_model.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';
import 'package:medical_app/features/auth/data/repository/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(LoginInitial());
  LoginRequestModel loginRequestModel = LoginRequestModel();
  final AuthRepository _authRepository;
  Future<void> login(AuthMethodEnum signupMethod) async {
    emit(LoginLoading());
    loginRequestModel.signupMethod = signupMethod;
    final result = await _authRepository.login(loginRequestModel);
    result.fold((l) => emit(LoginFailure(l)), (r) => emit(LoginSuccess(r)));
  }

  void setEmail(String email) => loginRequestModel.email = email;
  void setPassword(String password) => loginRequestModel.password = password;
}
