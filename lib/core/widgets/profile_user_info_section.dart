import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/fetures/patient_profile/presentation/view/widgets/custom_user_info_widget.dart';
import 'package:medical_app/core/widgets/medical_record_section.dart';

class ProfileUserInfoSection extends StatelessWidget {
  const ProfileUserInfoSection({
    super.key,
    required this.isDoctor,
    this.name,
    this.age,
    this.state,
    this.medicalRecord,
  });
  final bool isDoctor;
  final String? name;
  final String? age;
  final String? state;
  final String? medicalRecord;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: !isDoctor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomUserInfoWidget(
                  title: AppStrings.name,
                  value: name ?? 'Patient Name',
                ),
                Divider(color: AppColors.primaryColor),
              ],
            ),
          ),
          CustomUserInfoWidget(
            title: AppStrings.age,
            value: age ?? '22',
          ),
          Divider(color: AppColors.primaryColor),
          CustomUserInfoWidget(
            title: AppStrings.state,
            value: state ?? 'Normal',
          ),
          Divider(color: AppColors.primaryColor),
          MedicalRecordSection(isDoctor: !isDoctor, value: medicalRecord ?? ''),
        ],
      ),
    );
  }
}
