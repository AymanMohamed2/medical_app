import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/errors/server_failure.dart';
import 'package:medical_app/core/exceptions/firebase_auth_exception.dart';
import 'package:medical_app/features/auth/data/datasources/remote_data_source/base_auth_remote_datasource.dart';
import 'package:medical_app/features/auth/data/strategies/signup_strategy/signup_factory.dart';
import 'package:medical_app/features/auth/data/models/signup_request_model.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';
import 'package:medical_app/features/auth/data/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final BaseAuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<Either<Failure, UserModel>> signUp(
      SignupRequestModel signupRequestModel) async {
    try {
      var user =
          await SignupFactory.create(signupRequestModel, authRemoteDataSource)
              .signUp(signupRequestModel);
      return Right(user);
    } on CustomFirebaseAuthException catch (e) {
      return Left(ServerFailure(errMessage: e.message));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
