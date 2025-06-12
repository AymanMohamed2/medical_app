import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/errors/server_failure.dart';
import 'package:medical_app/features/patient_home/data/models/consult_doctor_request_model.dart';
import 'package:medical_app/features/patient_home/data/models/doctors_model/base_doctors_model.dart';
import 'package:medical_app/features/patient_home/data/repository/doctors_repository.dart';

class DoctorsRepoImpl extends DoctorsRepository {
  @override
  Future<Either<Failure, BaseDoctorsModel>> getDoctors([String? name]) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('userRole', isEqualTo: 'doctor')
          .where('name', isGreaterThanOrEqualTo: name)
          .get();
      return right(BaseDoctorsModel.fromQuerySnapshot(querySnapshot.docs));
    } on Exception catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> consultDoctor(
      ConsultDoctorRequestModel model) async {
    try {
      await FirebaseFirestore.instance
          .collection('doctors_consaltant')
          .add(model.toJson());
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
