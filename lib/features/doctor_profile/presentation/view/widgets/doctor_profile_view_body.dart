import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/features/doctor_profile/presentation/view/widgets/doctor_profile_info_section.dart';
import 'package:medical_app/core/widgets/patient_card_list_view.dart';
import 'package:medical_app/features/patient_profile/presentation/view/widgets/iamge_name_gmail_section.dart';

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
            imageUrl:
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
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
        PatientCardListView(
          isIconVisible: false,
          isHome: false,
        ),
      ],
    );
  }
}
