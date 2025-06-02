import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/patient_home/data/models/doctors_model/base_doctors_model.dart';
import 'package:medical_app/features/patient_home/data/repository/doctors_repository.dart';

part 'fetch_doctors_state.dart';

class FetchDoctorsCubit extends Cubit<FetchDoctorsState> {
  FetchDoctorsCubit(this._doctorsRepository) : super(FetchDoctorsInitial());
  final DoctorsRepository _doctorsRepository;

  Future<void> fetchDoctors([String? search]) async {
    emit(FetchDoctorsLoading());
    final result = await _doctorsRepository.getDoctors(search);
    result.fold((failure) => emit(FetchDoctorsFailure(failure)),
        (doctors) => emit(FetchDoctorsSuccess(doctors)));
  }

  void addInitialState() {
    emit(FetchDoctorsInitial());
  }
}
