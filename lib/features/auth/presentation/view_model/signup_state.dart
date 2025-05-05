import 'package:medical_app/core/errors/faliure.dart';

class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupError extends SignupState {
  final Failure failure;
  SignupError(this.failure);
}
