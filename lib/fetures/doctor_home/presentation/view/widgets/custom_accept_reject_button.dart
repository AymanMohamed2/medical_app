import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/widgets/custom_border.dart';
import 'package:medical_app/core/widgets/custom_inkwell_widget.dart';

class CustomAcceptRejectButton extends StatelessWidget {
  const CustomAcceptRejectButton({
    super.key,
    required this.title,
    required this.radius,
    required this.textColor,
    required this.onTap,
  });
  final String title;
  final double radius;
  final Color textColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkwellWidget(
      onTap: onTap,
      child: CustomBorder(
        radius: radius,
        padding: EdgeInsets.zero,
        borderClolor: AppColors.black.withAlpha(50),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: AppColors.backButton,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Center(
              child: Text(
                title,
                style: AppStyles.semiBold15(context).copyWith(
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
