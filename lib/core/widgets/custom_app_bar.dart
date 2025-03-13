import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/features/doctor_home/presentation/view/schedule_view.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onPressed,
    this.isVisible = false,
  });
  final String title;
  final void Function()? onPressed;
  final bool? isVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.primaryColor.withAlpha(60),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: onPressed,
              icon: const Icon(
                size: 19,
                Icons.arrow_back_ios,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              title,
              style: AppStyles.semiBold19(context)
                  .copyWith(color: AppColors.primaryColor),
            ),
            Spacer(),
            Visibility(
              visible: isVisible!,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const ScheduleView(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(
                      size: 19,
                      Icons.schedule,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
