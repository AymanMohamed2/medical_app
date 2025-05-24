import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/enums/signup_method_enum.dart';
import 'package:medical_app/core/enums/user_role_enum.dart';
import 'package:medical_app/features/auth/data/models/signup_request_model.dart';
import 'package:medical_app/features/auth/data/repository/auth_repository.dart';
import 'package:medical_app/features/auth/presentation/view_model/signup_cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepository) : super(SignupInitial());
  String? name;
  String? email;
  String? password;
  String? hospital;
  String? confirmPassword;
  UserRoleEnum? userRoleEnum;

  final AuthRepository authRepository;
  Future<void> signUp(AuthMethodEnum signupMethod, bool isCompleteData) async {
    emit(SignupLoading());
    final signupRequestModel = buildRequestModel(signupMethod, isCompleteData);
    final result = await authRepository.signUp(signupRequestModel);
    result.fold((l) => emit(SignupError(l)), (r) => emit(SignupSuccess(r)));
  }

  SignupRequestModel buildRequestModel(
      AuthMethodEnum signupMethod, bool isCompleteData) {
    return SignupRequestModel(
        isCompleteData: isCompleteData,
        email: email,
        password: password,
        signupMethod: signupMethod,
        name: name,
        hospital: hospital,
        userRole: userRoleEnum,
        confirmPassword: confirmPassword);
  }

  void setEmail(String email) => this.email = email;
  void setPassword(String password) => this.password = password;
  void setConfirmPassword(String confirmPassword) =>
      this.confirmPassword = confirmPassword;
  void setName(String name) => this.name = name;
  void setHospital(String hospital) => this.hospital = hospital;
}
