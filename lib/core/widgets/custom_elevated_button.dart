import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.text,
    this.child,
    this.radius,
    this.textStyle,
    this.buttonColor,
    this.disableBackgroundColor,
  });
  final void Function()? onPressed;
  final String? text;
  final Widget? child;
  final double? radius;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final Color? disableBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          disabledBackgroundColor: disableBackgroundColor,
          backgroundColor: buttonColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 10))),
      onPressed: onPressed,
      child: child ??
          Text(
            text!,
            textAlign: TextAlign.center,
            style: textStyle ??
                AppStyles.bold9(context).copyWith(color: AppColors.white),
          ),
    );
  }
}
