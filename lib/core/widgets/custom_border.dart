import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';

class CustomBorder extends StatelessWidget {
  const CustomBorder({
    super.key,
    required this.child,
    this.padding,
    this.radius,
    this.borderClolor,
    this.backgroundColor,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final Color? borderClolor;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderClolor ?? AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(radius ?? 10)),
      child: child,
    );
  }
}
