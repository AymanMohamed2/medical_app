import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/utils/service_locator.dart';
import 'package:medical_app/features/doctor_home/data/models/base_doctors_consaltant_model.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/patient_report_view_body.dart';
import 'package:medical_app/features/patient_home/data/repository/patient_vitals_repository.dart';
import 'package:medical_app/features/patient_home/data/repository/pbm_repository.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/fetch_bpm_cubit/fetch_bpm_cubit.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/patient_vitals_cubit/fetch_patient_vitals_cubit.dart';

class PatientReportView extends StatelessWidget {
  const PatientReportView(
      {super.key,
      required this.isVisible,
      required this.doctorConsaltantModel});
  final bool isVisible;
  final DoctorConsaltantModel doctorConsaltantModel;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FetchBpmCubit(getIt.get<BpmRepository>())),
        BlocProvider(
            create: (context) =>
                FetchPatientVitalsCubit(getIt.get<PatientVitalsRepository>())),
      ],
      child: SafeArea(
          child: Scaffold(
        body: PatientReportViewBody(
          doctorConsaltantModel: doctorConsaltantModel,
          isVisible: isVisible,
        ),
      )),
    );
  }
}
