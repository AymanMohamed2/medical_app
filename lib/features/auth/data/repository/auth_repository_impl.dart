import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/errors/server_failure.dart';
import 'package:medical_app/core/exceptions/firebase_auth_exception.dart';
import 'package:medical_app/core/strategies/auth_strategies/login_strategy/login_strategy_factory.dart';
import 'package:medical_app/core/utils/get_user_data.dart';
import 'package:medical_app/features/auth/data/datasources/local_data_source/base_auth_locale_datasource.dart';
import 'package:medical_app/features/auth/data/datasources/remote_data_source/base_auth_remote_datasource.dart';
import 'package:medical_app/core/strategies/auth_strategies/signup_strategy/signup_factory.dart';
import 'package:medical_app/features/auth/data/models/login_request_model.dart';
import 'package:medical_app/features/auth/data/models/signup_request_model.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';
import 'package:medical_app/features/auth/data/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final BaseAuthRemoteDataSource authRemoteDataSource;
  final BaseAuthLocaleDatasource baseAuthLocaleDatasource;
  final LoginStrategyFactory loginStrategyFactory;
  AuthRepositoryImpl(this.authRemoteDataSource, this.baseAuthLocaleDatasource,
      this.loginStrategyFactory);
  @override
  Future<Either<Failure, UserModel>> signUp(
      SignupRequestModel signupRequestModel) async {
    try {
      var user =
          await SignupFactory.create(signupRequestModel, authRemoteDataSource)
              .signUp(signupRequestModel);
      await baseAuthLocaleDatasource.saveUser(user);
      await GetUserData.init();
      return Right(user);
    } on CustomFirebaseAuthException catch (e) {
      return Left(ServerFailure(errMessage: e.message));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<UserModel?> getUserData() async {
    return await baseAuthLocaleDatasource.getUser();
  }

  @override
  Future<Either<Failure, UserModel>> login(
      LoginRequestModel loginRequestModel) async {
    try {
      var user = await loginStrategyFactory
          .create(loginRequestModel.signupMethod!)
          .login(loginRequestModel);
      await baseAuthLocaleDatasource.saveUser(user);
      await GetUserData.init();

      return Right(user);
    } on CustomFirebaseAuthException catch (e) {
      return Left(ServerFailure(errMessage: e.message));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
