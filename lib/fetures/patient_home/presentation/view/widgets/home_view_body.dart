import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/fetures/patient_home/presentation/view/widgets/ecg_readings.dart';
import 'package:medical_app/fetures/auth/presentation/view/widgets/doctors_grid_view.dart';
import 'package:medical_app/core/widgets/vital_signs_section.dart';
import 'package:medical_app/fetures/patient_home/presentation/view/widgets/welcome_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: WelcomeSection(),
          ),
          SliverToBoxAdapter(
            child: VitalSignsSection(),
          ),
          SliverToBoxAdapter(
            child: EcgReadings(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                AppStrings.popDoctors,
                style: AppStyles.semiBold19(context)
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
          ),
          DoctorsGridView(),
        ],
      ),
    );
  }
}
