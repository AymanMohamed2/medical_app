import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/core/functions/get_custom_day_week_number.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_vital_failure_container.dart';
import 'package:medical_app/features/patient_home/data/models/fetch_vitals_request_model.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/patient_vitals_cubit/fetch_patient_vitals_cubit.dart';

class OtherPatientVitalFailureSection extends StatelessWidget {
  const OtherPatientVitalFailureSection(
      {super.key, this.hour, this.day, this.isCanReload = true});
  final int? hour;
  final int? day;
  final bool isCanReload;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomVitalFailureContainer(
            isCanReload: isCanReload,
            icon: FontAwesomeIcons.temperatureThreeQuarters,
            unit: AppStrings.tempUnit,
            color: AppColors.darkRedColor,
            onPressed: isCanReload
                ? () {
                    final request = FetchVitalsRequestModel(
                        day: getCustomWeekDayNumber(DateTime.now()),
                        hour: DateTime.now().hour);
                    context
                        .read<FetchPatientVitalsCubit>()
                        .fetchPatientVitals(request);
                  }
                : null,
            backColor: AppColors.lightSemon,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: CustomVitalFailureContainer(
            isCanReload: isCanReload,
            icon: FontAwesomeIcons.droplet,
            unit: AppStrings.oxygenUnit,
            color: AppColors.darkGreen,
            onPressed: isCanReload
                ? () {
                    final request = FetchVitalsRequestModel(
                        day: getCustomWeekDayNumber(DateTime.now()),
                        hour: DateTime.now().hour);
                    context
                        .read<FetchPatientVitalsCubit>()
                        .fetchPatientVitals(request);
                  }
                : null,
            backColor: AppColors.lightGreen,
          ),
        ),
      ],
    );
  }
}
