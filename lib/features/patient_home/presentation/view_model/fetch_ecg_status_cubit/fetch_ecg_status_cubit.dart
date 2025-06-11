import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/patient_home/data/models/base_ecg_model.dart';
import 'package:medical_app/features/patient_home/data/repository/ecg_repository.dart';

part 'fetch_ecg_status_state.dart';

class FetchEcgStatusCubit extends Cubit<FetchEcgStatusState> {
  FetchEcgStatusCubit(this._ecgRepository) : super(FetchEcgStatusInitial());
  final EcgRepository _ecgRepository;
  Future<void> fetchEcgStatus() async {
    emit(FetchEcgStatusLoading());
    final result = await _ecgRepository.fetchEcgStatus();
    result.fold((failure) => emit(FetchEcgStatusFailure(failure)),
        (ecg) => emit(FetchEcgStatusSuccess(ecg)));
  }
}
