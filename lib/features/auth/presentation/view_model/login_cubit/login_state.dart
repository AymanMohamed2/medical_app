part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final UserModel userModel;
  LoginSuccess(this.userModel);
}

final class LoginFailure extends LoginState {
  final Failure failure;
  LoginFailure(this.failure);
}
