import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/patient_home/data/models/base_ecg_model.dart';

abstract class EcgRepository {
  Future<Either<Failure, BaseEcgModel>> fetchEcgStatus();
}
