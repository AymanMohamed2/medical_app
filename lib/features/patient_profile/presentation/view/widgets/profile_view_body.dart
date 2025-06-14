import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/get_user_data.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/core/widgets/logout_button.dart';
import 'package:medical_app/features/auth/presentation/view_model/complete_data_cubit/complete_data_cubit.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/fetch_ecg_status_cubit/fetch_ecg_status_cubit.dart';
import 'package:medical_app/features/patient_profile/presentation/view/widgets/iamge_name_gmail_section.dart';
import 'package:medical_app/core/widgets/profile_user_info_section.dart';
import 'package:medical_app/features/patient_profile/presentation/view/widgets/profile_vitals_section.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteDataCubit, CompleteDataState>(
      builder: (context, state) {
        return PopScope(
          canPop: state is! CompleteDataLoading,
          child: ModalProgressHUD(
            dismissible: state is CompleteDataLoading,
            inAsyncCall: state is CompleteDataLoading,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    isBackButtonVisible: false,
                    title: AppStrings.appBarProfile,
                  ),
                  SizedBox(height: 27),
                  IamgeNameGmailSection(
                    imageUrl: GetUserData.user!.image,
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
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: LogoutButton(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
