import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medical_app/core/entities/message_entity.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/errors/server_failure.dart';
import 'package:medical_app/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:medical_app/features/chat/data/datasources/base_home_data_source.dart';
import 'package:medical_app/features/chat/domain/repositories/home_repository.dart';

class HomeRepoImpl extends HomeRepository {
  final BaseHomeDataSource baseHomeDataSource;

  HomeRepoImpl(this.baseHomeDataSource);
  @override
  Future<Either<Failure, MessageEntity>> sendMessage(
      SendMessageRequestModel sendMessageRequestModel) async {
    try {
      var result =
          await baseHomeDataSource.sendMessage(sendMessageRequestModel);
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
