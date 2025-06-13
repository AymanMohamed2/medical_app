import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/doctor_home/data/models/base_doctors_consaltant_model.dart';
import 'package:medical_app/features/doctor_home/data/models/fetch_consult_doctor_request_model.dart';
import 'package:medical_app/features/doctor_home/data/models/fetch_patient_consaltants_request_model.dart';
import 'package:medical_app/features/doctor_home/data/models/response_consaltant_request_model.dart';
import 'package:medical_app/features/doctor_home/data/repository/consaltant_doctor_repository.dart';

part 'fetch_consaltants_state.dart';

class FetchConsaltantsCubit extends Cubit<FetchConsaltantsState> {
  FetchConsaltantsCubit(this._consaltantDoctorRepository)
      : super(FetchConsaltantsInitial());
  final ConsaltantDoctorRepository _consaltantDoctorRepository;
  BaseDoctorsConsaltantModel? consaltants;

  Future<void> fetchConsaltants(FetchConsultDoctorRequestModel request) async {
    emit(FetchConsaltantsLoading());
    final failureOrConsaltants =
        await _consaltantDoctorRepository.getConsaltantDoctors(request);
    failureOrConsaltants.fold(
        (failure) => emit(FetchConsaltantsFailure(failure)), (consaltants) {
      this.consaltants = consaltants;
      emit(FetchConsaltantsSuccess(consaltants));
    });
  }

  void deleteConsaltant(ResponseConsaltantRequestModel request) async {
    consaltants!.deleteConsaltant(request.id!);
    emit(FetchConsaltantsSuccess(consaltants!));
  }

  Future<void> fetchPatientConsaltants(
      FetchPatientConsaltantsRequestModel request) async {
    emit(FetchConsaltantsLoading());
    final failureOrConsaltants =
        await _consaltantDoctorRepository.fetchPatientConsaltants(request);
    failureOrConsaltants.fold(
        (failure) => emit(FetchConsaltantsFailure(failure)), (consaltants) {
      this.consaltants = consaltants;
      emit(FetchConsaltantsSuccess(consaltants));
    });
  }
}
