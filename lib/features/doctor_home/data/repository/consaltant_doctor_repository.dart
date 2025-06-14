import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/doctor_home/data/models/base_doctors_consaltant_model.dart';
import 'package:medical_app/features/doctor_home/data/models/fetch_consult_doctor_request_model.dart';
import 'package:medical_app/features/doctor_home/data/models/fetch_patient_consaltants_request_model.dart';
import 'package:medical_app/features/doctor_home/data/models/response_consaltant_request_model.dart';

abstract class ConsaltantDoctorRepository {
  Future<Either<Failure, BaseDoctorsConsaltantModel>> getConsaltantDoctors(
      FetchConsultDoctorRequestModel request);
  Future<Either<Failure, BaseDoctorsConsaltantModel>> fetchPatientConsaltants(
      FetchPatientConsaltantsRequestModel request);
  Future<Either<Failure, void>> responseConsaltant(
      ResponseConsaltantRequestModel request);
}
