import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserModel user;

  SignupSuccess(this.user);
}

class SignupError extends SignupState {
  final Failure failure;
  SignupError(this.failure);
}
