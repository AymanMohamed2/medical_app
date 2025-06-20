import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.text,
    this.textStyle,
    this.height,
    this.backgroundColor,
    this.child,
    this.borderRadius,
    this.padding,
  });
  final VoidCallback? onPressed;
  final String? text;
  final TextStyle? textStyle;
  final double? height;
  final Color? backgroundColor;
  final Widget? child;
  final double? borderRadius;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 54,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 20,
            ),
          ),
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding ?? 16),
          child: child ??
              Text(
                text ?? '',
                style: textStyle ??
                    AppStyles.medium24(context).copyWith(
                      color: Colors.white,
                    ),
              ),
        ),
      ),
    );
  }
}
