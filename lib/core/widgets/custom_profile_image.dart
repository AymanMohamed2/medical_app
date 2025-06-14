import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/widgets/custom_border.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/custom_cached_network_image.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    required this.imageUrl,
    required this.radius,
    required this.circurlarRadius,
  });
  final String imageUrl;
  final double radius;
  final double circurlarRadius;
  @override
  Widget build(BuildContext context) {
    return CustomBorder(
      padding: EdgeInsets.zero,
      radius: radius,
      shape: BoxShape.circle,
      borderClolor: AppColors.primaryColor.withAlpha(90),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          height: circurlarRadius,
          width: circurlarRadius,
          child: CustomCashedNetworkImage(
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
