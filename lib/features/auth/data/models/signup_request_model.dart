import 'package:medical_app/core/enums/signup_method_enum.dart';
import 'package:medical_app/core/enums/user_role_enum.dart';

class SignupRequestModel {
  final String? name;
  final String? email;
  final String? password;
  final String? hospital;
  final String? confirmPassword;
  final SignupMethodEnum? signupMethod;
  final UserRoleEnum? userRole;
  final String? medicalCondition;
  SignupRequestModel(
      {this.email,
      this.password,
      this.name,
      this.hospital,
      this.signupMethod,
      this.userRole,
      this.medicalCondition,
      this.confirmPassword});
}
