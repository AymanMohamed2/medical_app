import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/custom_accept_reject_button.dart';

class AcceptRejectSection extends StatelessWidget {
  const AcceptRejectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: CustomAcceptRejectButton(
              title: AppStrings.accept,
              radius: 10,
              textColor: AppColors.green,
              onTap: () {},
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: CustomAcceptRejectButton(
              title: AppStrings.reject,
              radius: 10,
              textColor: AppColors.red,
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
