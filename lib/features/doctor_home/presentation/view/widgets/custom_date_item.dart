import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';

class CustomDateItem extends StatelessWidget {
  const CustomDateItem({
    super.key,
    required this.day,
    required this.isActive,
    required this.date,
    this.backgroundColor,
  });

  final String day;
  final bool isActive;
  final String date;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: 100,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(left: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: backgroundColor ??
              (isActive ? AppColors.primaryColor : Colors.transparent),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primaryColor,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                date,
                style: isActive
                    ? AppStyles.bold12(context).copyWith(color: AppColors.white)
                    : AppStyles.bold12(context),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                textAlign: TextAlign.center,
                day,
                style: isActive
                    ? AppStyles.bold12(context).copyWith(color: AppColors.white)
                    : AppStyles.bold12(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
