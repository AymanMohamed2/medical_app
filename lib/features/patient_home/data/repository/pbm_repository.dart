import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/patient_home/data/models/base_pbm_model.dart';

abstract class BpmRepository {
  Future<Either<Failure, BasePbmModel>> fetchPbm();
}
