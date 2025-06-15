import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/enums/ecg_status_enum.dart';
import 'package:medical_app/core/functions/get_custom_day_week_number.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/features/patient_home/data/models/fetch_vitals_request_model.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/doctors_bloc_builder.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/ecg_readings.dart';
import 'package:medical_app/core/widgets/vital_signs_section.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/welcome_section.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/consult_doctor_cubit/consult_doctor_cubit.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/fetch_bpm_cubit/fetch_bpm_cubit.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/fetch_ecg_status_cubit/fetch_ecg_status_cubit.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/patient_vitals_cubit/fetch_patient_vitals_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<FetchPatientVitalsCubit>().fetchPatientVitals(
        FetchVitalsRequestModel(
            day: getCustomWeekDayNumber(DateTime.now()),
            hour: DateTime.now().hour));
    context.read<FetchBpmCubit>().fetchBpm();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConsultDoctorCubit, ConsultDoctorState>(
      builder: (context, state) {
        return PopScope(
          canPop: state is! ConsultDoctorLoading,
          child: ModalProgressHUD(
            dismissible: state is ConsultDoctorLoading,
            inAsyncCall: state is ConsultDoctorLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: WelcomeSection(),
                  ),
                  SliverToBoxAdapter(
                    child: VitalSignsSection(
                      day: 30,
                      hour: 30,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child:
                        BlocBuilder<FetchEcgStatusCubit, FetchEcgStatusState>(
                      builder: (context, state) {
                        if (state is FetchEcgStatusSuccess) {
                          return EcgStatusWidgetFactory.create(
                              state.baseEcgModel.ecgStatusEnum);
                        } else if (state is FetchEcgStatusLoading) {
                          return EcgReadingsLoading();
                        }
                        return EcgReadings();
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        AppStrings.popDoctors,
                        style: AppStyles.semiBold19(context)
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  DoctorsBlocBuilder(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

abstract class EcgStatusWidgetFactory {
  static Widget create(EcgStatusEnum ecgStatusEnum) {
    switch (ecgStatusEnum) {
      case EcgStatusEnum.normal:
        return EcgReadings(
          title: AppStrings.ecgStatusNormal,
          backgroundColor: AppColors.green,
        );
      case EcgStatusEnum.abnormal:
        return EcgReadings(
          title: AppStrings.ecgStatusAbnormal,
          backgroundColor: AppColors.darkRedColor,
        );
    }
  }
}
