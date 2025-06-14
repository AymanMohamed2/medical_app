import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/enums/consultant_status_enum.dart';
import 'package:medical_app/core/enums/ecg_status_enum.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_border.dart';
import 'package:medical_app/core/widgets/custom_button.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:medical_app/features/patient_home/data/models/consult_doctor_request_model.dart';
import 'package:medical_app/features/patient_home/data/models/doctors_model/doctor_model.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/doctor_info_section.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/consult_doctor_cubit/consult_doctor_cubit.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/patient_vitals_cubit/fetch_patient_vitals_cubit.dart';

class CustomDoctorCard extends StatelessWidget {
  const CustomDoctorCard({super.key, required this.doctorModel});
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return CustomBorder(
      borderClolor: AppColors.black.withAlpha(50),
      padding: EdgeInsets.zero,
      radius: 22,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: CustomCashedNetworkImage(
                    imageUrl: doctorModel.imageUrl,
                  ),
                ),
              ),
              DoctorInfoSection(
                doctorModel: doctorModel,
              ),
              BlocBuilder<FetchPatientVitalsCubit, FetchPatientVitalsState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 32,
                    child: CustomButton(
                      text: AppStrings.consult,
                      textStyle: AppStyles.bold12(context)
                          .copyWith(color: AppColors.white),
                      backgroundColor: AppColors.primaryColor,
                      onPressed: context
                                  .read<FetchPatientVitalsCubit>()
                                  .basePatientVitalsModel ==
                              null
                          ? null
                          : () {
                              ConsultDoctorRequestModel model =
                                  ConsultDoctorRequestModel(
                                      doctorName: doctorModel.name,
                                      doctorImage: doctorModel.imageUrl,
                                      doctorId: doctorModel.id,
                                      consultantStatus:
                                          ConsultantStatusEnum.pending,
                                      ecgStatusEnum: EcgStatusEnum.normal,
                                      date: context
                                          .read<FetchPatientVitalsCubit>()
                                          .basePatientVitalsModel!
                                          .readingsDate);
                              context
                                  .read<ConsultDoctorCubit>()
                                  .consultDoctor(model);
                            },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
