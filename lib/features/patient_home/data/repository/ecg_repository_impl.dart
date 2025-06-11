import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medical_app/core/constants/api_urls.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/errors/server_failure.dart';
import 'package:medical_app/core/networking/api_service.dart';
import 'package:medical_app/features/patient_home/data/models/base_ecg_model.dart';
import 'package:medical_app/features/patient_home/data/repository/ecg_repository.dart';

class EcgRepositoryImpl extends EcgRepository {
  final ApiService apiService;

  EcgRepositoryImpl(this.apiService);

  @override
  Future<Either<Failure, BaseEcgModel>> fetchEcgStatus() async {
    final result = await apiService.get(url: ApiUrls.ecgUrl);
    try {
      return right(BaseEcgModel.fromJson(result.data));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }
}
