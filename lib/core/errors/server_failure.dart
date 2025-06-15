import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/utils/lottie_assets.dart';

class ServerFailure extends Failure {
  ServerFailure(
      {required super.errMessage, super.lottieAnimation, super.repeat});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'انتهت مهلة الاتصال');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'انتهت مهلة الإرسال إلى الخادم');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'انتهت مهلة الاستلام من الخادم');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);

      case DioExceptionType.connectionError:
        return ServerFailure(
            repeat: true,
            errMessage: 'لا يوجد اتصال بالإنترنت',
            lottieAnimation: LottieAssets.noInternet);

      default:
        return ServerFailure(
            errMessage: 'عذرًا، حدث خطأ. يرجى المحاولة مرة أخرى.');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic json) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(
            errMessage: json['message'] ?? 'حدث خطأ. يرجى المحاولة مرة أخري');

      case 404:
        return ServerFailure(
            errMessage: 'لم يتم العثور على طلبك. يرجى المحاولة مرة أخرى.');

      case 408:
        return ServerFailure(
            errMessage: 'انتهت مهلة الطلب. يرجى المحاولة مرة أخرى.');

      case 429:
        return ServerFailure(
            errMessage: 'عدد الطلبات كبير جدًا. يرجى التخفيف.');

      case 500:
        log(json.toString());
        return ServerFailure(
            errMessage: 'خطأ داخلي في الخادم. يرجى المحاولة مرة أخرى.');

      case 502:
        return ServerFailure(
            errMessage: 'بوابة سيئة. يرجى المحاولة مرة أخرى لاحقًا.');

      case 503:
        return ServerFailure(
            errMessage: 'النظام غير متاح. يرجى المحاولة مرة أخرى لاحقًا.');

      default:
        log(json.toString());
        return ServerFailure(
            errMessage: 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.');
    }
  }
}
