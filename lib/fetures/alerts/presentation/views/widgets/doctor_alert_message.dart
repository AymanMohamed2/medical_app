import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/widgets/custom_profile_image.dart';

class DoctorAlertMessage extends StatelessWidget {
  const DoctorAlertMessage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });
  final String imageUrl;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.primaryColor.withAlpha(60),
          ),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: CustomProfileImage(
              radius: 25,
              imageUrl: imageUrl,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 13),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.semiBold14(context),
                  ),
                  Text(
                    subTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.regular13(context)
                        .copyWith(color: AppColors.inactiveColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
