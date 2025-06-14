import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/get_user_data.dart';
import 'package:medical_app/features/patient_profile/presentation/view/widgets/custom_user_info_widget.dart';

class DoctorProfileInfoSection extends StatelessWidget {
  const DoctorProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomUserInfoWidget(
            title: AppStrings.name,
            value: GetUserData.user!.name!,
          ),
          Divider(color: AppColors.primaryColor),
          CustomUserInfoWidget(
            title: AppStrings.field,
            value: 'Neurologist',
          ),
          Divider(color: AppColors.primaryColor),
        ],
      ),
    );
  }
}
