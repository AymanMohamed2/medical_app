import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/widgets/custom_border.dart';
import 'package:medical_app/core/widgets/custom_inkwell_widget.dart';
import 'package:medical_app/fetures/auth/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:medical_app/fetures/doctor_home/presentation/view/patient_report_view.dart';

class CustomPatientCard extends StatelessWidget {
  const CustomPatientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInkwellWidget(
      radius: 22,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const PatientReportView(),
          ),
        );
      },
      child: SizedBox(
        height: 110,
        child: CustomBorder(
          padding: EdgeInsets.zero,
          radius: 22,
          borderClolor: AppColors.primaryColor.withAlpha(80),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: SizedBox(
                  width: 89,
                  height: 87,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: CustomCashedNetworkImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 18),
                    Text(
                      'Alex chen',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.semiBold19(context),
                    ),
                    Text(
                      'diagnoses',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.regularr14(context),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '9:00 pm',
                            style: AppStyles.bold13(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
