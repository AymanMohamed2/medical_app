part of 'fetch_doctors_cubit.dart';

sealed class FetchDoctorsState {}

final class FetchDoctorsInitial extends FetchDoctorsState {}

final class FetchDoctorsLoading extends FetchDoctorsState {}

final class FetchDoctorsSuccess extends FetchDoctorsState {
  final BaseDoctorsModel baseDoctorsModel;
  FetchDoctorsSuccess(this.baseDoctorsModel);
}

final class FetchDoctorsFailure extends FetchDoctorsState {
  final Failure failure;
  FetchDoctorsFailure(this.failure);
}
