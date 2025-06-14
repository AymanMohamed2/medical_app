part of 'fetch_consaltants_cubit.dart';

sealed class FetchConsaltantsState {}

final class FetchConsaltantsInitial extends FetchConsaltantsState {}

final class FetchConsaltantsLoading extends FetchConsaltantsState {}

final class FetchConsaltantsSuccess extends FetchConsaltantsState {
  final BaseDoctorsConsaltantModel baseDoctorsConsaltantModel;
  FetchConsaltantsSuccess(this.baseDoctorsConsaltantModel);
}

final class FetchConsaltantsFailure extends FetchConsaltantsState {
  final Failure failure;
  FetchConsaltantsFailure(this.failure);
}
