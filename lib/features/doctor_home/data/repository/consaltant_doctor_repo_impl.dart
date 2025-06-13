import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:medical_app/core/enums/consultant_status_enum.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/errors/server_failure.dart';
import 'package:medical_app/features/doctor_home/data/models/base_doctors_consaltant_model.dart';
import 'package:medical_app/features/doctor_home/data/models/fetch_consult_doctor_request_model.dart';
import 'package:medical_app/features/doctor_home/data/models/fetch_patient_consaltants_request_model.dart';
import 'package:medical_app/features/doctor_home/data/models/response_consaltant_request_model.dart';
import 'package:medical_app/features/doctor_home/data/repository/consaltant_doctor_repository.dart';

class ConsaltantDoctorRepoImpl extends ConsaltantDoctorRepository {
  @override
  Future<Either<Failure, BaseDoctorsConsaltantModel>> getConsaltantDoctors(
      FetchConsultDoctorRequestModel request) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('doctors_consaltant')
          .where('doctorId', isEqualTo: request.doctorId)
          .where('consultantStatus', isEqualTo: request.status.name)
          .get();
      return right(
          BaseDoctorsConsaltantModel.fromQuerySnapshot(querySnapshot.docs));
    } on Exception catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> responseConsaltant(
      ResponseConsaltantRequestModel request) async {
    try {
      await FirebaseFirestore.instance
          .collection('doctors_consaltant')
          .doc(request.id)
          .update(request.toJson());
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BaseDoctorsConsaltantModel>> fetchPatientConsaltants(
      FetchPatientConsaltantsRequestModel request) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('doctors_consaltant')
          .where('patient_email', isEqualTo: request.patientEmail)
          .where('consultantStatus',
              isNotEqualTo: ConsultantStatusEnum.pending.name)
          .get();
      return right(
          BaseDoctorsConsaltantModel.fromQuerySnapshot(querySnapshot.docs));
    } on Exception catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
