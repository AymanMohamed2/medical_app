import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/enums/consultant_status_enum.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/features/doctor_home/data/models/base_doctors_consaltant_model.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/custom_accept_reject_button.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/date_list_view.dart';
import 'package:medical_app/features/doctor_home/presentation/view_model/response_consaltant_cubit/response_consaltant_cubit.dart';

class AcceptRejectSection extends StatelessWidget {
  const AcceptRejectSection(
      {super.key,
      required this.dateKey,
      required this.formKey,
      required this.model});
  final GlobalKey<DateListViewState> dateKey;
  final GlobalKey<FormState> formKey;
  final DoctorConsaltantModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: CustomAcceptRejectButton(
              title: AppStrings.accept,
              radius: 10,
              textColor: AppColors.green,
              onTap: () {
                bool? dateValid = dateKey.currentState?.validate();
                bool? formValid = formKey.currentState?.validate();
                if (dateValid! && formValid!) {
                  context
                      .read<ResponseConsaltantCubit>()
                      .setConsaltantId(model.id);
                  context
                      .read<ResponseConsaltantCubit>()
                      .setStatus(ConsultantStatusEnum.accepted);
                  context
                      .read<ResponseConsaltantCubit>()
                      .setConsaltantId(model.id);
                  context.read<ResponseConsaltantCubit>().responseConsaltant();
                }
              },
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: CustomAcceptRejectButton(
              title: AppStrings.reject,
              radius: 10,
              textColor: AppColors.red,
              onTap: () {
                context
                    .read<ResponseConsaltantCubit>()
                    .setConsaltantId(model.id);
                context
                    .read<ResponseConsaltantCubit>()
                    .setStatus(ConsultantStatusEnum.rejected);
              },
            ),
          )
        ],
      ),
    );
  }
}
