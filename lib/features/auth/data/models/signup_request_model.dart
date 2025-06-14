import 'package:image_picker/image_picker.dart';
import 'package:medical_app/core/enums/signup_method_enum.dart';
import 'package:medical_app/core/enums/user_role_enum.dart';

class SignupRequestModel {
  final String? name;
  final String? email;
  final String? password;
  final String? hospital;
  final String? confirmPassword;
  final AuthMethodEnum? signupMethod;
  final UserRoleEnum? userRole;
  final String? medicalCondition;
  final bool isCompleteData;
  final String? age;
  final String? speciality;
  XFile? profileImage;

  SignupRequestModel(
      {this.email,
      this.password,
      this.name,
      this.hospital,
      this.age,
      this.profileImage,
      required this.isCompleteData,
      this.signupMethod,
      this.speciality,
      this.userRole,
      this.medicalCondition,
      this.confirmPassword});
}
