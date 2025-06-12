import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_app/core/enums/signup_method_enum.dart';
import 'package:medical_app/core/enums/user_role_enum.dart';
import 'package:medical_app/features/auth/data/models/signup_request_model.dart';

class UserModel {
  final String? name;
  final String? email;
  final String? password;
  final String? hospital;
  final String image;
  final String? confirmPassword;
  final AuthMethodEnum? signupMethod;
  final UserRoleEnum? userRole;
  final String? uId;
  final String? medicalCondidion;
  final String? age;
  bool isCompeleteData;
  UserModel(
      {this.name,
      this.email,
      this.image = '',
      this.password,
      this.hospital,
      this.age,
      this.confirmPassword,
      this.signupMethod,
      required this.isCompeleteData,
      this.uId,
      this.medicalCondidion,
      this.userRole});

  factory UserModel.fromFirebaseUser(
          User user, SignupRequestModel signupRequestModel) =>
      UserModel(
          isCompeleteData: signupRequestModel.isCompleteData,
          uId: user.uid,
          email: user.email,
          age: signupRequestModel.age,
          name: user.displayName,
          signupMethod: signupRequestModel.signupMethod,
          userRole: signupRequestModel.userRole);
  factory UserModel.fromSignupRequestModel(
          SignupRequestModel signupRequestModel, User user) =>
      UserModel(
          isCompeleteData: signupRequestModel.isCompleteData,
          medicalCondidion: signupRequestModel.medicalCondition,
          uId: user.uid,
          email: signupRequestModel.email,
          age: signupRequestModel.age,
          password: signupRequestModel.password,
          name: signupRequestModel.name,
          hospital: signupRequestModel.hospital,
          signupMethod: signupRequestModel.signupMethod,
          userRole: signupRequestModel.userRole);

  factory UserModel.fromFirebaseJson(Map<String, dynamic> json, User user) =>
      UserModel(
          isCompeleteData: json['isCompeleteData'],
          medicalCondidion: json['medicalCondidion'],
          uId: user.uid,
          email: json['email'],
          age: json['age'],
          hospital: json['hospital'],
          signupMethod: getSignupMethod(json['signupMethod']),
          userRole: json['userRole'] == 'patient'
              ? UserRoleEnum.patient
              : UserRoleEnum.doctor);
  Map<String, dynamic> toJson() => {
        'medicalCondidion': medicalCondidion,
        'uId': uId,
        'email': email,
        'isCompeleteData': isCompeleteData,
        'name': name,
        'hospital': hospital,
        'signupMethod': signupMethod?.name,
        'userRole': userRole?.name,
        'age': age,
      };

  static AuthMethodEnum getSignupMethod(String method) {
    switch (method) {
      case 'email':
        return AuthMethodEnum.email;
      case 'google':
        return AuthMethodEnum.google;
      case 'facebook':
        return AuthMethodEnum.facebook;
      default:
        return AuthMethodEnum.email;
    }
  }
}
