part of 'fetch_patient_vitals_cubit.dart';

sealed class FetchPatientVitalsState {}

final class FetchPatientVitalsInitial extends FetchPatientVitalsState {}

final class FetchPatientVitalsLoading extends FetchPatientVitalsState {}

final class FetchPatientVitalsFailure extends FetchPatientVitalsState {
  final Failure failure;
  FetchPatientVitalsFailure(this.failure);
}

final class FetchPatientVitalsSuccess extends FetchPatientVitalsState {
  final BasePatientVitalsModel basePatientVitalsModel;
  FetchPatientVitalsSuccess(this.basePatientVitalsModel);
}
