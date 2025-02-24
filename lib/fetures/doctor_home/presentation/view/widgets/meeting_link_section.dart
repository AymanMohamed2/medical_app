import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_button.dart';
import 'package:medical_app/core/widgets/custom_text_form_field.dart';

class MeetingLinkSection extends StatelessWidget {
  const MeetingLinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    hintStyle: AppStyles.semiBold15(context)
                        .copyWith(color: Colors.grey),
                    hintText: AppStrings.enterMeetingLink,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 6,
                child: SizedBox(
                  height: 45,
                  child: CustomButton(
                    padding: 5,
                    text: AppStrings.generate,
                    textStyle:
                        AppStyles.bold13(context).copyWith(color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
