import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';

class MedicalRecordSection extends StatelessWidget {
  const MedicalRecordSection({super.key, this.value, required this.isDoctor});
  final String? value;
  final bool isDoctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(AppStrings.medicalRecord,
                style: AppStyles.semiBold19(context)),
            Spacer(),
            Visibility(
              visible: isDoctor,
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.edit,
                    size: 15,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
        SizedBox(height: 5),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            value ?? '',
            style: AppStyles.semiBold15(context),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
