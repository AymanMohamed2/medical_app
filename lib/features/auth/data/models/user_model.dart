import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_app/core/enums/signup_method_enum.dart';
import 'package:medical_app/core/enums/user_role_enum.dart';
import 'package:medical_app/features/auth/data/models/signup_request_model.dart';

class UserModel {
  final String? name;
  final String? email;
  final String? password;
  final String? hospital;
  final String? confirmPassword;
  final SignupMethodEnum? signupMethod;
  final UserRoleEnum? userRole;
  final String? uId;
  final String? medicalCondidion;
  UserModel(
      {this.name,
      this.email,
      this.password,
      this.hospital,
      this.confirmPassword,
      this.signupMethod,
      this.uId,
      this.medicalCondidion,
      this.userRole});

  factory UserModel.fromFirebaseUser(
          User user, SignupRequestModel signupRequestModel) =>
      UserModel(
          uId: user.uid,
          email: user.email,
          name: user.displayName,
          signupMethod: signupRequestModel.signupMethod,
          userRole: signupRequestModel.userRole);
  factory UserModel.fromSignupRequestModel(
          SignupRequestModel signupRequestModel, User user) =>
      UserModel(
          medicalCondidion: signupRequestModel.medicalCondition,
          uId: user.uid,
          email: signupRequestModel.email,
          password: signupRequestModel.password,
          name: signupRequestModel.name,
          hospital: signupRequestModel.hospital,
          signupMethod: signupRequestModel.signupMethod,
          userRole: signupRequestModel.userRole);
  Map<String, dynamic> toJson() => {
        'medicalCondidion': medicalCondidion,
        'uId': uId,
        'email': email,
        'name': name,
        'hospital': hospital,
        'signupMethod': signupMethod?.name,
        'userRole': userRole?.name,
      };
}
