import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_vital_failure_container.dart';

import 'package:medical_app/core/widgets/custom_vital_loading_container.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/custom_vital_container.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/fetch_bpm_cubit/fetch_bpm_cubit.dart';

class BpmBlocBuilder extends StatelessWidget {
  const BpmBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchBpmCubit, FetchBpmState>(
      builder: (context, state) {
        if (state is FetchBpmSuccess) {
          return CustomVitalContainer(
            icon: FontAwesomeIcons.heartPulse,
            unit: AppStrings.heartPulsesUnit,
            value: state.basePbmModel.bpm,
            color: AppColors.darkRedColor,
            backColor: AppColors.lightPink,
          );
        } else if (state is FetchBpmFailure) {
          return CustomVitalFailureContainer(
            icon: FontAwesomeIcons.heartPulse,
            unit: AppStrings.heartPulsesUnit,
            color: AppColors.darkRedColor,
            backColor: AppColors.lightPink,
          );
        } else {
          return CustomVitalLoadingContainer();
        }
      },
    );
  }
}
