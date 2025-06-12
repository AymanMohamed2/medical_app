import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/patient_home/data/models/consult_doctor_request_model.dart';
import 'package:medical_app/features/patient_home/data/models/doctors_model/base_doctors_model.dart';

abstract class DoctorsRepository {
  Future<Either<Failure, BaseDoctorsModel>> getDoctors([String? name]);
  Future<Either<Failure, void>> consultDoctor(ConsultDoctorRequestModel model);
}
