import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/widgets/custom_border.dart';
import 'package:medical_app/core/widgets/custom_inkwell_widget.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:medical_app/features/doctor_home/data/models/base_doctors_consaltant_model.dart';
import 'package:medical_app/features/doctor_home/presentation/view/patient_report_view.dart';
import 'package:medical_app/features/doctor_home/presentation/view_model/fetch_consaltants_cubit/fetch_consaltants_cubit.dart';

class CustomPatientCard extends StatelessWidget {
  const CustomPatientCard(
      {super.key,
      required this.isVisible,
      required this.doctorConsaltantModel});
  final bool isVisible;
  final DoctorConsaltantModel doctorConsaltantModel;
  @override
  Widget build(BuildContext context) {
    return CustomInkwellWidget(
      radius: 22,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext acontext) => BlocProvider.value(
              value: context.read<FetchConsaltantsCubit>(),
              child: PatientReportView(
                doctorConsaltantModel: doctorConsaltantModel,
                isVisible: isVisible,
              ),
            ),
          ),
        );
      },
      child: CustomBorder(
        padding: EdgeInsets.zero,
        radius: 22,
        borderClolor: AppColors.primaryColor.withAlpha(80),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: SizedBox(
                width: 89,
                height: 87,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: CustomCashedNetworkImage(),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 18),
                  Text(
                    doctorConsaltantModel.patientName,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.semiBold19(context),
                  ),
                  Text(
                    doctorConsaltantModel.ecgStatusEnum,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.regularr14(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          doctorConsaltantModel.time!,
                          style: AppStyles.bold13(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
