import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/auth/data/models/complete_data_request_model.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';
import 'package:medical_app/features/auth/data/repository/auth_repository.dart';

part 'complete_data_state.dart';

class CompleteDataCubit extends Cubit<CompleteDataState> {
  CompleteDataCubit(this._authRepository) : super(CompleteDataInitial());
  final AuthRepository _authRepository;
  Future<void> completeData(
      CompleteDataRequestModel completeDataRequestModel) async {
    emit(CompleteDataLoading());
    final result = await _authRepository.completeData(completeDataRequestModel);
    result.fold((l) => emit(CompleteDataFailure(failure: l)),
        (r) => emit(CompleteDataSuccess(r)));
  }
}
