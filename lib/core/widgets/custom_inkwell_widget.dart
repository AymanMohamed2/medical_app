import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';

class CustomInkwellWidget extends StatelessWidget {
  const CustomInkwellWidget({
    super.key,
    this.onTap,
    this.radius,
    required this.child,
  });
  final void Function()? onTap;
  final double? radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // ignore: deprecated_member_use
      splashColor: AppColors.primaryColor.withOpacity(0.3),
      // ignore: deprecated_member_use
      highlightColor: AppColors.primaryColor.withOpacity(0.3),
      borderRadius: BorderRadius.circular(radius ?? 12),
      onTap: onTap,
      child: child,
    );
  }
}
