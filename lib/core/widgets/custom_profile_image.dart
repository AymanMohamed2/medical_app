import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/fetures/auth/presentation/view/widgets/custom_cached_network_image.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.searchFillGrayColor,
      radius: 25,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: SizedBox(
          height: 50,
          child: CustomCashedNetworkImage(
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
