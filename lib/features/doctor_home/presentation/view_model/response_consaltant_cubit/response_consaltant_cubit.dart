import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/enums/consultant_status_enum.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/doctor_home/data/models/response_consaltant_request_model.dart';
import 'package:medical_app/features/doctor_home/data/repository/consaltant_doctor_repository.dart';

part 'response_consaltant_state.dart';

class ResponseConsaltantCubit extends Cubit<ResponseConsaltantState> {
  ResponseConsaltantCubit(this._consaltantDoctorRepository)
      : super(ResponseConsaltantInitial());
  final ConsaltantDoctorRepository _consaltantDoctorRepository;
  ResponseConsaltantRequestModel? request = ResponseConsaltantRequestModel();
  Future<void> responseConsaltant() async {
    emit(ResponseConsaltantLoading());
    final failureOrConsaltants =
        await _consaltantDoctorRepository.responseConsaltant(request!);
    failureOrConsaltants.fold(
        (failure) => emit(ResponseConsaltantFailure(failure)),
        (consaltants) => emit(ResponseConsaltantSuccess(request!)));
  }

  void setSelectedDate(DateTime dateTime) {
    request!.date = dateTime;
  }

  void setSelectedTime(String time) {
    request!.time = time;
  }

  void setMeetingLink(String meetingLink) {
    request!.meetingLink = meetingLink;
  }

  void setConsaltantId(String consaltantId) {
    request!.id = consaltantId;
  }

  void setStatus(ConsultantStatusEnum status) {
    request!.status = status;
  }
}
