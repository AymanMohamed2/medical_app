import 'package:medical_app/core/utils/lottie_assets.dart';

abstract class Failure {
  final String errMessage;
  final String lottieAnimation;
  final bool repeat;

  Failure(
      {required this.errMessage,
      this.lottieAnimation = LottieAssets.warning,
      this.repeat = false});
}
