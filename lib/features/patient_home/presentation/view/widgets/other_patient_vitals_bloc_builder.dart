import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/other_patient_vital_failure_section.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/other_vitals_loading_section.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/patient_vital_section.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/patient_vitals_cubit/fetch_patient_vitals_cubit.dart';

class OtherPatientVitalsBlocBuilder extends StatelessWidget {
  const OtherPatientVitalsBlocBuilder({
    super.key,
    this.day,
    this.hour,
    this.isCanReload = true,
  });
  final int? day;
  final int? hour;
  final bool isCanReload;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPatientVitalsCubit, FetchPatientVitalsState>(
      builder: (context, state) {
        if (state is FetchPatientVitalsSuccess) {
          return PatientVitalSection(
            patientVitalsModel: state.basePatientVitalsModel,
          );
        } else if (state is FetchPatientVitalsFailure) {
          return OtherPatientVitalFailureSection(
            isCanReload: isCanReload,
            day: day,
            hour: hour,
          );
        } else {
          return OtherVitalsLoadingSection();
        }
      },
    );
  }
}
