import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/fetures/doctor_home/presentation/view/widgets/welcome_panner_widget.dart';
import 'package:medical_app/core/widgets/patient_card_list_view.dart';

class DoctorHomeViewBody extends StatelessWidget {
  const DoctorHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: WelcomePannerWidget(),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 22)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  AppStrings.todayReservations,
                  style: AppStyles.semiBold20(context)
                      .copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 13)),
          PatientCardListView(
            isIconVisible: true,
            isHome: true,
          ),
        ],
      ),
    );
  }
}
