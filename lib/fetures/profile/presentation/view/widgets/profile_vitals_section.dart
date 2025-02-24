import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/fetures/home/presentation/view/widgets/vital_signs_section.dart';

class ProfileVitalsSection extends StatelessWidget {
  const ProfileVitalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.vitals,
            style: AppStyles.semiBold20(context)
                .copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(height: 12),
          VitalSignsSection(),
        ],
      ),
    );
  }
}
