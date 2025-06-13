import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/core/widgets/profile_user_info_section.dart';
import 'package:medical_app/core/widgets/vital_signs_section.dart';
import 'package:medical_app/features/doctor_home/data/models/base_doctors_consaltant_model.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/custom_week_hour_picker.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/ecg_taple_widget.dart';
import 'package:medical_app/features/patient_home/data/models/fetch_vitals_request_model.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/fetch_bpm_cubit/fetch_bpm_cubit.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/patient_vitals_cubit/fetch_patient_vitals_cubit.dart';
import 'package:medical_app/features/patient_profile/presentation/view/widgets/iamge_name_gmail_section.dart';

class PatientReportViewBody extends StatelessWidget {
  const PatientReportViewBody({
    super.key,
    required this.isVisible,
    required this.doctorConsaltantModel,
  });
  final bool isVisible;
  final DoctorConsaltantModel doctorConsaltantModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            model: doctorConsaltantModel,
            title: AppStrings.patientReport,
            onPressed: () {
              Navigator.pop(context);
            },
            isVisible: isVisible,
          ),
          SizedBox(height: 27),
          IamgeNameGmailSection(
            imageUrl: doctorConsaltantModel.patientImage,
            name: doctorConsaltantModel.patientName,
            gmail: doctorConsaltantModel.patientEmail,
          ),
          SizedBox(height: 25),
          ProfileUserInfoSection(
            isDoctor: true,
            age: doctorConsaltantModel.patientAge,
            state: doctorConsaltantModel.ecgStatusEnum,
            medicalRecord: doctorConsaltantModel.medicalCondidion,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26, top: 20, bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.vitals,
                style: AppStyles.semiBold20(context)
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomWeekHourPicker(
              sliderColor: AppColors.primaryColor,
              selectedColor: AppColors.primaryColor,
              onChange: ({required selectedDay, required selectedHour}) {
                context.read<FetchBpmCubit>().fetchBpm();
                final request = FetchVitalsRequestModel(
                    day: selectedDay, hour: selectedHour);
                context
                    .read<FetchPatientVitalsCubit>()
                    .fetchPatientVitals(request);
              },
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: VitalSignsSection(),
          ),
          SizedBox(height: 15),
          BlocBuilder<FetchPatientVitalsCubit, FetchPatientVitalsState>(
            builder: (context, state) {
              if (state is FetchPatientVitalsSuccess) {
                return ECGTable();
              } else if (state is FetchPatientVitalsFailure) {
                return Align(
                    child: Center(child: Text(state.failure.errMessage)));
              } else {
                return Align(
                    child: const Center(child: CircularProgressIndicator()));
              }
            },
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
