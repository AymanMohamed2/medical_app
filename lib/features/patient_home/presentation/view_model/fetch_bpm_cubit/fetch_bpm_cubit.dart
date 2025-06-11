import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/patient_home/data/models/base_pbm_model.dart';
import 'package:medical_app/features/patient_home/data/repository/pbm_repository.dart';

part 'fetch_bpm_state.dart';

class FetchBpmCubit extends Cubit<FetchBpmState> {
  FetchBpmCubit(this._pbmRepository) : super(FetchBpmInitial());
  final BpmRepository _pbmRepository;

  Future<void> fetchBpm() async {
    emit(FetchBpmLoading());
    final result = await _pbmRepository.fetchPbm();
    result.fold((failure) => emit(FetchBpmFailure(failure)),
        (pbm) => emit(FetchBpmSuccess(pbm)));
  }
}
