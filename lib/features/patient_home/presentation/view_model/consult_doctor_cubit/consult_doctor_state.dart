part of 'consult_doctor_cubit.dart';

sealed class ConsultDoctorState {}

final class ConsultDoctorInitial extends ConsultDoctorState {}

final class ConsultDoctorLoading extends ConsultDoctorState {}

final class ConsultDoctorSuccess extends ConsultDoctorState {}

final class ConsultDoctorFailure extends ConsultDoctorState {
  final Failure failure;
  ConsultDoctorFailure({required this.failure});
}
