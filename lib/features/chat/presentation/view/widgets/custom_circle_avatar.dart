import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/assets.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: AssetImage(Assets.imagesChatbot),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        shadows: const [
          BoxShadow(
            color: AppColors.darkGrey,
            blurRadius: 24,
            offset: Offset(4, 4),
            spreadRadius: 0,
          )
        ],
      ),
    );
  }
}
