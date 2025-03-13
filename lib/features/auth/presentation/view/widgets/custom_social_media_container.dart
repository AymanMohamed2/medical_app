import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/assets.dart';

class CustomSocialMediaContainer extends StatelessWidget {
  const CustomSocialMediaContainer({super.key, this.icon, this.onTap});
  final String? icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 95,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withAlpha(20),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: SizedBox(
            width: 28,
            child: Image.asset(
              icon ?? Assets.imagesGoogle,
            ),
          ),
        ),
      ),
    );
  }
}
