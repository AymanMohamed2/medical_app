import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/core/widgets/profile_user_info_section.dart';
import 'package:medical_app/core/widgets/vital_signs_section.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/ecg_taple_widget.dart';
import 'package:medical_app/features/patient_profile/presentation/view/widgets/iamge_name_gmail_section.dart';

class PatientReportViewBody extends StatelessWidget {
  const PatientReportViewBody({
    super.key,
    required this.isVisible,
  });
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            title: AppStrings.patientReport,
            onPressed: () {
              Navigator.pop(context);
            },
            isVisible: isVisible,
          ),
          SizedBox(height: 27),
          IamgeNameGmailSection(
            imageUrl:
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
            name: 'Patient Name',
            gmail: 'Patient Gmail@gmail.com',
          ),
          SizedBox(height: 25),
          ProfileUserInfoSection(
            isDoctor: true,
            name: 'Patient Name',
            age: '22',
            state: 'Normal',
            medicalRecord:
                'Lorem ipsum dolor sit amet, consectetr adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit ametsapien fringilla, mattis ligula consecter,ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue.',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26, top: 20, bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.vitals,
                style: AppStyles.semiBold20(context)
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: VitalSignsSection(),
          ),
          SizedBox(height: 15),
          ECGTable(),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
