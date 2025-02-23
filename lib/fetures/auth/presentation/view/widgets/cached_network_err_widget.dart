import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/core/utils/lottie_assets.dart';
import 'package:medical_app/core/theme/app_colors.dart';

class CachedNetworkErrorWidget extends StatelessWidget {
  const CachedNetworkErrorWidget({
    super.key,
    this.aspectRatio,
  });
  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.textFieldBorderColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
            aspectRatio: aspectRatio ?? 2.8 / 4,
            child: Lottie.asset(LottieAssets.noImage)),
      ),
    );
  }
}
