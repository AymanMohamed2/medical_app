import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/get_user_data.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/fetch_ecg_status_cubit/fetch_ecg_status_cubit.dart';
import 'package:medical_app/features/patient_profile/presentation/view/widgets/iamge_name_gmail_section.dart';
import 'package:medical_app/core/widgets/profile_user_info_section.dart';
import 'package:medical_app/features/patient_profile/presentation/view/widgets/profile_vitals_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            isBackButtonVisible: false,
            title: AppStrings.appBarProfile,
          ),
          SizedBox(height: 27),
          IamgeNameGmailSection(
            imageUrl:
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
            name: GetUserData.user!.name!,
            gmail: GetUserData.user!.email!,
          ),
          SizedBox(height: 30),
          ProfileVitalsSection(),
          SizedBox(height: 30),
          BlocBuilder<FetchEcgStatusCubit, FetchEcgStatusState>(
            builder: (context, state) {
              return ProfileUserInfoSection(
                isDoctor: false,
                name: GetUserData.user!.name!,
                age: GetUserData.user!.age!,
                state: state is FetchEcgStatusSuccess
                    ? state.baseEcgModel.ecgStatusEnum.name
                    : '....',
                medicalRecord: GetUserData.user!.medicalCondidion!,
              );
            },
          ),
        ],
      ),
    );
  }
}
