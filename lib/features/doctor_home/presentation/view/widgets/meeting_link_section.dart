import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/app_validators.dart';
import 'package:medical_app/core/widgets/custom_text_form_field.dart';
import 'package:medical_app/features/doctor_home/presentation/view_model/response_consaltant_cubit/response_consaltant_cubit.dart';

class MeetingLinkSection extends StatelessWidget {
  const MeetingLinkSection({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text(
                AppStrings.meetingLing,
                style: AppStyles.semiBold16(context)
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: SizedBox(
                    height: 45,
                    child: CustomTextField(
                      onChanged: (value) {
                        context
                            .read<ResponseConsaltantCubit>()
                            .setMeetingLink(value);
                      },
                      errorStyle: TextStyle(height: 0, fontSize: 0),
                      validator: (value) {
                        return AppValidators.generalValidator(
                            value, 'Meeting Link');
                      },
                      hintStyle: AppStyles.semiBold15(context)
                          .copyWith(color: Colors.grey),
                      hintText: AppStrings.enterMeetingLink,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
