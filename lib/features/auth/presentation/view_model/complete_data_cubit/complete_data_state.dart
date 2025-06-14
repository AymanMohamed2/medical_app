part of 'complete_data_cubit.dart';

sealed class CompleteDataState {}

final class CompleteDataInitial extends CompleteDataState {}

final class CompleteDataLoading extends CompleteDataState {}

final class CompleteDataSuccess extends CompleteDataState {
  final UserModel userModel;
  CompleteDataSuccess(this.userModel);
}

final class CompleteDataFailure extends CompleteDataState {
  final Failure failure;
  CompleteDataFailure({required this.failure});
}
