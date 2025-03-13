import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';

class DangerAlertMessage extends StatelessWidget {
  const DangerAlertMessage({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.time,
  });
  final IconData icon;
  final String title;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundRed.withOpacity(0.33),
        border: Border(
          bottom: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
              width: 85,
              child: Center(
                  child:
                      FaIcon(icon, color: AppColors.darkRedColor, size: 45))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.semiBold14(context),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                time,
                                style: AppStyles.regular13(context)
                                    .copyWith(color: AppColors.darkGray),
                              ),
                              SizedBox(width: 12.5),
                              Text(
                                date,
                                style: AppStyles.regular13(context)
                                    .copyWith(color: AppColors.darkGray),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
