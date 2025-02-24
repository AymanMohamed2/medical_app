import 'package:flutter/material.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/fetures/patient_profile/presentation/view/widgets/iamge_name_gmail_section.dart';
import 'package:medical_app/fetures/patient_profile/presentation/view/widgets/profile_user_info_section.dart';
import 'package:medical_app/fetures/patient_profile/presentation/view/widgets/profile_vitals_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: AppStrings.appBarProfile, onPressed: () {}),
          SizedBox(height: 27),
          IamgeNameGmailSection(
            imageUrl: 'https://i.pravatar.cc/300',
            name: 'Patient Name',
            gmail: 'Patient Gmail@gmail.com',
          ),
          SizedBox(height: 30),
          ProfileVitalsSection(),
          SizedBox(height: 30),
          ProfileUserInfoSection(),
        ],
      ),
    );
  }
}
