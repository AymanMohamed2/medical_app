import 'package:medical_app/core/enums/signup_method_enum.dart';

class LoginRequestModel {
  String? email;
  String? password;
  AuthMethodEnum? signupMethod;

  LoginRequestModel({this.email, this.password, this.signupMethod});
}
