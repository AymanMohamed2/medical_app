import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_vital_failure_container.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/patient_vitals_cubit/fetch_patient_vitals_cubit.dart';

class OtherPatientVitalFailureSection extends StatelessWidget {
  const OtherPatientVitalFailureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomVitalFailureContainer(
            icon: FontAwesomeIcons.temperatureThreeQuarters,
            unit: AppStrings.tempUnit,
            color: AppColors.darkRedColor,
            onPressed: () {
              context.read<FetchPatientVitalsCubit>().fetchPatientVitals();
            },
            backColor: AppColors.lightSemon,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: CustomVitalFailureContainer(
            icon: FontAwesomeIcons.droplet,
            unit: AppStrings.oxygenUnit,
            color: AppColors.darkGreen,
            onPressed: () {
              context.read<FetchPatientVitalsCubit>().fetchPatientVitals();
            },
            backColor: AppColors.lightGreen,
          ),
        ),
      ],
    );
  }
}
