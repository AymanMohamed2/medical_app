import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/fetures/profile/presentation/view/widgets/custom_user_info_widget.dart';
import 'package:medical_app/fetures/profile/presentation/view/widgets/medical_record_section.dart';

class ProfileUserInfoSection extends StatelessWidget {
  const ProfileUserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomUserInfoWidget(
            title: AppStrings.name,
            value: 'Patient Name',
          ),
          Divider(color: AppColors.primaryColor),
          CustomUserInfoWidget(
            title: AppStrings.age,
            value: '22',
          ),
          Divider(color: AppColors.primaryColor),
          CustomUserInfoWidget(
            title: AppStrings.state,
            value: 'Normal',
          ),
          Divider(color: AppColors.primaryColor),
          MedicalRecordSection(
            value:
                'Lorem ipsum dolor sit amet, consectetr adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit ametsapien fringilla, mattis ligula consecter,ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue.',
          ),
        ],
      ),
    );
  }
}
