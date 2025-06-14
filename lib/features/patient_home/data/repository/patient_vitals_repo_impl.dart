import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medical_app/core/constants/api_urls.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/errors/server_failure.dart';
import 'package:medical_app/core/networking/api_service.dart';
import 'package:medical_app/features/patient_home/data/models/fetch_vitals_request_model.dart';
import 'package:medical_app/features/patient_home/data/models/patient_vitals_model/base_patient_vitals_model.dart';
import 'package:medical_app/features/patient_home/data/repository/patient_vitals_repository.dart';

class PatientVitalsRepoImpl extends PatientVitalsRepository {
  final ApiService apiService;

  PatientVitalsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, BasePatientVitalsModel>> fetchPatientVitals(
      FetchVitalsRequestModel request) async {
    final result = await apiService.get(
        url:
            '${ApiUrls.patientVitalsUrl}day/${request.day}/hour/${request.hour}');
    try {
      return right(BasePatientVitalsModel.fromJson(result.data));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }
}
