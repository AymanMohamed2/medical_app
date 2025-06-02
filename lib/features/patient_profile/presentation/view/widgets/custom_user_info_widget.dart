import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';

class CustomUserInfoWidget extends StatelessWidget {
  const CustomUserInfoWidget({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.semiBold20(context)
              .copyWith(color: AppColors.primaryColor),
        ),
        Text(value,
            style: AppStyles.semiBold16(context)
                .copyWith(color: AppColors.primaryColor)),
      ],
    );
  }
}
