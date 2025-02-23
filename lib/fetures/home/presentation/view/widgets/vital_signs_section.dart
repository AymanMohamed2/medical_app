import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/fetures/home/presentation/view/widgets/custom_vital_container.dart';

class VitalSignsSection extends StatelessWidget {
  const VitalSignsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: CustomVitalContainer(
            icon: FontAwesomeIcons.heartPulse,
            unit: AppStrings.heartPulsesUnit,
            value: '123',
            color: AppColors.darkRedColor,
            backColor: AppColors.lightPink,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: CustomVitalContainer(
            icon: FontAwesomeIcons.temperatureThreeQuarters,
            unit: AppStrings.tempUnit,
            color: AppColors.darkRedColor,
            value: '75',
            backColor: AppColors.lightSemon,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: CustomVitalContainer(
            icon: FontAwesomeIcons.droplet,
            unit: AppStrings.oxygenUnit,
            color: AppColors.darkGreen,
            value: '88',
            backColor: AppColors.lightGreen,
          ),
        ),
      ],
    );
  }
}
