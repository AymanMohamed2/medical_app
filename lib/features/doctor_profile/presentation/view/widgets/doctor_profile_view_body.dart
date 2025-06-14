import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/get_user_data.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/fetch_consaltant_bloc_builder.dart';
import 'package:medical_app/features/doctor_profile/presentation/view/widgets/doctor_profile_info_section.dart';
import 'package:medical_app/features/patient_profile/presentation/view/widgets/iamge_name_gmail_section.dart';

class DoctorProfileViewBody extends StatelessWidget {
  const DoctorProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: CustomAppBar(
                isLogoutVisible: true,
                isVisible: false,
                title: AppStrings.appBarProfile,
                onPressed: () {})),
        SliverToBoxAdapter(child: SizedBox(height: 27)),
        SliverToBoxAdapter(
          child: IamgeNameGmailSection(
            imageUrl: GetUserData.user!.image,
            name: GetUserData.user!.name!,
            gmail: GetUserData.user!.email!,
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
        FetchConsaltantBlocBuilder(
          padding: EdgeInsets.symmetric(horizontal: 16),
          isScachuleIconVisible: false,
        ),
      ],
    );
  }
}
