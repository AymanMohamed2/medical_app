import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/custom_fading_widget.dart';

class CustomVitalLoadingContainer extends StatelessWidget {
  const CustomVitalLoadingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
