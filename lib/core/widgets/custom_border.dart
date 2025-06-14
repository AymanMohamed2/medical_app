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
    this.shape,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final Color? borderClolor;
  final Color? backgroundColor;
  final BoxShape? shape;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      decoration: BoxDecoration(
          color: backgroundColor,
          shape: shape ?? BoxShape.rectangle,
          border: Border.all(
            color: borderClolor ?? AppColors.primaryColor,
          ),
          borderRadius: shape == BoxShape.circle
              ? null
              : BorderRadius.circular(radius ?? 10)),
      child: child,
    );
  }
}
