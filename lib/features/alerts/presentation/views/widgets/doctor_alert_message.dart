import 'package:flutter/material.dart';
import 'package:medical_app/core/enums/consultant_status_enum.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/widgets/custom_profile_image.dart';
import 'package:medical_app/features/doctor_home/data/models/base_doctors_consaltant_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorAlertMessage extends StatelessWidget {
  const DoctorAlertMessage({
    super.key,
    required this.doctorConsaltantModel,
  });
  final DoctorConsaltantModel doctorConsaltantModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.primaryColor.withAlpha(60),
          ),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: CustomProfileImage(
              radius: 25,
              imageUrl: doctorConsaltantModel.doctorImage,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 13),
                  Text(
                    doctorConsaltantModel.doctorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.semiBold14(context),
                  ),
                  Text(
                    getSubString(doctorConsaltantModel),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.regular13(context)
                        .copyWith(color: AppColors.inactiveColor),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible:
                doctorConsaltantModel.status == ConsultantStatusEnum.accepted,
            child: Column(
              children: [
                IconButton(
                    onPressed: isNowAfterTarget(
                            doctorConsaltantModel.date.toString(),
                            doctorConsaltantModel.meetingTime!)
                        ? () {
                            launchUrlQuick(doctorConsaltantModel.meetingLink!);
                          }
                        : null,
                    icon: Icon(
                      Icons.launch,
                      color: isNowAfterTarget(
                        doctorConsaltantModel.date.toString(),
                        doctorConsaltantModel.meetingTime!,
                      )
                          ? AppColors.primaryColor
                          : AppColors.inactiveColor,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> launchUrlQuick(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'لا يمكن فتح الرابط: $url';
    }
  }

  String getSubString(DoctorConsaltantModel model) {
    switch (model.status) {
      case ConsultantStatusEnum.accepted:
        return 'Dr. ${model.doctorName} Confirmed your Session at ${model.date.year}-${model.date.month}-${model.date.day}, ${model.meetingTime}';
      case ConsultantStatusEnum.pending:
        return 'pending';
      case ConsultantStatusEnum.rejected:
        return 'Your Session has been rejected by Dr. ${model.doctorName}';
    }
  }

  bool isNowAfterTarget(String dateStr, String timeStr) {
    final dateOnly = DateTime.parse(dateStr).toLocal();
    final timeParts = timeStr.split(' ');
    final time = timeParts[0];
    final period = timeParts[1];
    final hourMinute = time.split(':');
    int hour = int.parse(hourMinute[0]);
    int minute = int.parse(hourMinute[1]);
    if (period == 'PM' && hour != 12) hour += 12;
    if (period == 'AM' && hour == 12) hour = 0;
    final targetDateTime = DateTime(
      dateOnly.year,
      dateOnly.month,
      dateOnly.day,
      hour,
      minute,
    );
    final now = DateTime.now();
    return now.isAfter(targetDateTime);
  }

  String? getCountdownUntil(String dateStr, String timeStr) {
    final dateOnly = DateTime.parse(dateStr).toLocal();

    final timeParts = timeStr.split(' ');
    final time = timeParts[0];
    final period = timeParts[1];

    final hourMinute = time.split(':');
    int hour = int.parse(hourMinute[0]);
    int minute = int.parse(hourMinute[1]);

    if (period == 'PM' && hour != 12) hour += 12;
    if (period == 'AM' && hour == 12) hour = 0;

    final targetDateTime = DateTime(
      dateOnly.year,
      dateOnly.month,
      dateOnly.day,
      hour,
      minute,
    );

    final now = DateTime.now();

    if (now.isAfter(targetDateTime)) {
      return null; // أو return "00:00:00";
    }

    final difference = targetDateTime.difference(now);

    final hours = difference.inHours.toString().padLeft(2, '0');
    final minutes = (difference.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (difference.inSeconds % 60).toString().padLeft(2, '0');

    return "$hours:$minutes:$seconds";
  }
}
