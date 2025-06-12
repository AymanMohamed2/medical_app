import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/patient_home/data/models/consult_doctor_request_model.dart';
import 'package:medical_app/features/patient_home/data/repository/doctors_repository.dart';

part 'consult_doctor_state.dart';

class ConsultDoctorCubit extends Cubit<ConsultDoctorState> {
  ConsultDoctorCubit(this._doctorsRepository) : super(ConsultDoctorInitial());
  final DoctorsRepository _doctorsRepository;
  Future<void> consultDoctor(ConsultDoctorRequestModel model) async {
    emit(ConsultDoctorLoading());
    final result = await _doctorsRepository.consultDoctor(model);
    result.fold((l) => emit(ConsultDoctorFailure(failure: l)),
        (r) => emit(ConsultDoctorSuccess()));
  }
}
