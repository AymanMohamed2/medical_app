import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/utils/lottie_assets.dart';

class ServerFailure extends Failure {
  ServerFailure({
    required super.errMessage,
    super.lottieAnimation,
    super.repeat,
  });

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout.');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout to the server.');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout from the server.');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);

      case DioExceptionType.connectionError:
        return ServerFailure(
          repeat: true,
          errMessage: 'No internet connection.',
          lottieAnimation: LottieAssets.noInternet,
        );

      default:
        return ServerFailure(
          errMessage: 'Sorry, an error occurred. Please try again.',
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic json) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(
            errMessage:
                json['message'] ?? 'An error occurred. Please try again.');

      case 404:
        return ServerFailure(
            errMessage: 'Request not found. Please try again.');

      case 408:
        return ServerFailure(errMessage: 'Request timeout. Please try again.');

      case 429:
        return ServerFailure(
            errMessage: 'Too many requests. Please slow down.');

      case 500:
        return ServerFailure(
            errMessage: 'Internal server error. Please try again.');

      case 502:
        return ServerFailure(
            errMessage: 'Bad gateway. Please try again later.');

      case 503:
        return ServerFailure(
            errMessage: 'Service unavailable. Please try again later.');

      default:
        return ServerFailure(
            errMessage: 'Unexpected error occurred. Please try again.');
    }
  }
}
