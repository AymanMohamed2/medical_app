import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/widgets/custom_border.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/custom_cached_network_image.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    required this.imageUrl,
    required this.radius,
  });
  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CustomBorder(
      padding: EdgeInsets.zero,
      radius: radius,
      borderClolor: AppColors.primaryColor.withAlpha(90),
      child: CircleAvatar(
        backgroundColor: AppColors.searchFillGrayColor,
        radius: radius,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: SizedBox(
            height: radius * 2,
            child: CustomCashedNetworkImage(
              imageUrl: imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
