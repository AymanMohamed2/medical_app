import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';

class ValidatorTextWidget extends StatelessWidget {
  const ValidatorTextWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: AppStyles.bold10(context).copyWith(color: AppColors.red),
      ),
    );
  }
}
