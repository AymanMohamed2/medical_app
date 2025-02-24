import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_border.dart';
import 'package:medical_app/core/widgets/custom_button.dart';
import 'package:medical_app/fetures/auth/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:medical_app/fetures/home/presentation/view/widgets/doctor_info_section.dart';

class CustomDoctorCard extends StatelessWidget {
  const CustomDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBorder(
      borderClolor: AppColors.black.withAlpha(50),
      padding: EdgeInsets.zero,
      radius: 22,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: CustomCashedNetworkImage(
                    imageUrl:
                        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
                  ),
                ),
              ),
              DoctorInfoSection(),
              SizedBox(
                height: 32,
                child: CustomButton(
                  text: AppStrings.consult,
                  textStyle: AppStyles.bold12(context)
                      .copyWith(color: AppColors.white),
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
