import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/errors/server_failure.dart';
import 'package:medical_app/core/networking/api_service.dart';
import 'package:medical_app/core/constants/api_urls.dart';
import 'package:medical_app/features/patient_home/data/models/base_pbm_model.dart';
import 'package:medical_app/features/patient_home/data/repository/pbm_repository.dart';

class BpmRepositoryImpl extends BpmRepository {
  final ApiService apiService;
  BpmRepositoryImpl(this.apiService);

  @override
  Future<Either<Failure, BasePbmModel>> fetchPbm() async {
    final result = await apiService.get(url: ApiUrls.pbmUrl);
    try {
      return right(BasePbmModel.fromJson(result.data));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }
}
