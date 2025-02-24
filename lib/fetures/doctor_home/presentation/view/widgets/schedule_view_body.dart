import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/fetures/doctor_home/presentation/view/widgets/accept_reject_section.dart';
import 'package:medical_app/fetures/doctor_home/presentation/view/widgets/date_list_view.dart';
import 'package:medical_app/fetures/doctor_home/presentation/view/widgets/meeting_link_section.dart';
import 'package:medical_app/fetures/doctor_home/presentation/view/widgets/time_widget.dart';

class ScheduleViewBody extends StatelessWidget {
  const ScheduleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            title: AppStrings.scheduleMeeting,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 5),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(AppStrings.selectDate,
                    style: AppStyles.semiBold16(context)
                        .copyWith(color: AppColors.primaryColor))),
          ),
          DateListView(),
          SizedBox(height: 45),
          Text(
            AppStrings.selectTime,
            style: AppStyles.semiBold16(context)
                .copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(height: 5),
          TimeWidget(
            onTimeSelected: (time) {},
          ),
          SizedBox(height: 40),
          MeetingLinkSection(),
          SizedBox(height: 34),
          AcceptRejectSection(),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
