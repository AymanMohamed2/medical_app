import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/patient_home/data/models/patient_vitals_model/base_patient_vitals_model.dart';

abstract class PatientVitalsRepository {
  Future<Either<Failure, BasePatientVitalsModel>> fetchPatientVitals();
}
