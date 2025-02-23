import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.autoFocus = false,
    this.hintText,
    this.onChanged,
    this.controller,
    this.hintStyle,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.borderColor,
    this.errorBorderColor,
    this.validator,
    this.maxLength,
    this.errorStyle,
    this.autovalidateMode,
    this.errorBorderRadius,
    this.maxLines = 1,
    this.obscureText = false,
  });
  final String? hintText;
  final BorderRadius? errorBorderRadius;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? borderColor;
  final Color? errorBorderColor;
  final String? Function(String?)? validator;
  final int? maxLength;
  final bool autoFocus;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? errorStyle;
  final int? maxLines;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      autofocus: autoFocus,
      autovalidateMode: autovalidateMode,
      autocorrect: true,
      maxLength: maxLength,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        errorStyle: errorStyle ??
            AppStyles.light16(context).copyWith(color: AppColors.darkRedColor),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? AppColors.white,
        border: buildBorder(),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
        errorBorder: buildErrorBorder(),
        focusedErrorBorder: buildErrorBorder(),
        hintText: hintText,
        hintStyle: hintStyle,
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide:
          BorderSide(color: borderColor ?? AppColors.textFieldBorderColor),
    );
  }

  OutlineInputBorder buildErrorBorder() {
    return OutlineInputBorder(
      borderRadius: errorBorderRadius ?? BorderRadius.circular(20),
      borderSide: BorderSide(color: errorBorderColor ?? AppColors.darkRedColor),
    );
  }
}
