import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/fetures/doctor_profile/presentation/view/widgets/doctor_profile_info_section.dart';
import 'package:medical_app/fetures/doctor_profile/presentation/view/widgets/previous_sessions_list_view.dart';
import 'package:medical_app/fetures/patient_profile/presentation/view/widgets/iamge_name_gmail_section.dart';

class DoctorProfileViewBody extends StatelessWidget {
  const DoctorProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: CustomAppBar(
                title: AppStrings.appBarProfile, onPressed: () {})),
        SliverToBoxAdapter(child: SizedBox(height: 27)),
        SliverToBoxAdapter(
          child: IamgeNameGmailSection(
            imageUrl: 'https://i.pravatar.cc/300',
            name: 'Dr. John Doe',
            gmail: 'JohnDoe6o@gmail.com',
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 30)),
        SliverToBoxAdapter(child: DoctorProfileInfoSection()),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: Row(
            children: [
              SizedBox(width: 26),
              Text(
                AppStrings.previousSessions,
                style: AppStyles.semiBold20(context)
                    .copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 15)),
        PreviousSessionsListView(),
      ],
    );
  }
}
