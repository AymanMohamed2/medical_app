import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/features/patient_home/data/models/doctors_model/doctor_model.dart';

class DoctorInfoSection extends StatelessWidget {
  const DoctorInfoSection({super.key, required this.doctorModel});
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 4,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              doctorModel.name,
              style: AppStyles.semiBold14(context)),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            doctorModel.speciality,
            style: AppStyles.regular11(context)
                .copyWith(color: AppColors.darkGray),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              size: 20,
              color: AppColors.goldColor,
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
