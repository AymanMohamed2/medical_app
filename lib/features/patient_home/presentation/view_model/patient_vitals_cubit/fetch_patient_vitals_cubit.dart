import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/patient_home/data/models/fetch_vitals_request_model.dart';
import 'package:medical_app/features/patient_home/data/models/patient_vitals_model/base_patient_vitals_model.dart';
import 'package:medical_app/features/patient_home/data/repository/patient_vitals_repository.dart';

part 'fetch_patient_vitals_state.dart';

class FetchPatientVitalsCubit extends Cubit<FetchPatientVitalsState> {
  FetchPatientVitalsCubit(this._patientVitalsRepository)
      : super(FetchPatientVitalsInitial());

  BasePatientVitalsModel? basePatientVitalsModel;
  final PatientVitalsRepository _patientVitalsRepository;
  Future<void> fetchPatientVitals(FetchVitalsRequestModel request) async {
    emit(FetchPatientVitalsLoading());
    final result = await _patientVitalsRepository.fetchPatientVitals(request);
    result.fold((failure) => emit(FetchPatientVitalsFailure(failure)), (ecg) {
      basePatientVitalsModel = ecg;
      emit(FetchPatientVitalsSuccess(ecg));
    });
  }
}
