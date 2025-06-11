import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/features/patient_home/data/models/patient_vitals_model/base_patient_vitals_model.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/custom_vital_container.dart';

class PatientVitalSection extends StatelessWidget {
  const PatientVitalSection({
    super.key,
    required this.patientVitalsModel,
  });
  final BasePatientVitalsModel patientVitalsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomVitalContainer(
            icon: FontAwesomeIcons.temperatureThreeQuarters,
            unit: AppStrings.tempUnit,
            color: AppColors.darkRedColor,
            value: patientVitalsModel.bodyTemperature,
            backColor: AppColors.lightSemon,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: CustomVitalContainer(
            icon: FontAwesomeIcons.droplet,
            unit: AppStrings.oxygenUnit,
            color: AppColors.darkGreen,
            value: patientVitalsModel.bloodO2Level,
            backColor: AppColors.lightGreen,
          ),
        ),
      ],
    );
  }
}
