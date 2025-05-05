import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/features/auth/data/models/signup_request_model.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> signUp(
      SignupRequestModel signupRequestModel);
}
