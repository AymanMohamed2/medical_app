import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/assets.dart';
import 'package:medical_app/core/utils/get_user_data.dart';

class WelcomePannerWidget extends StatelessWidget {
  const WelcomePannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: AppColors.doctorPannerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 22.5),
                  Text(
                    AppStrings.hiDr,
                    style: AppStyles.semiBold20(context)
                        .copyWith(color: AppColors.white),
                  ),
                  Text(
                    GetUserData.user!.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppStyles.semiBold20(context)
                        .copyWith(color: AppColors.white),
                  ),
                  SizedBox(height: 15),
                  Text(
                    AppStrings.looksLike,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: AppStyles.bold12(context)
                        .copyWith(color: AppColors.white),
                  ),
                ],
              ),
            )),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(Assets.imagesDoctorPana),
            )
          ],
        ),
      ),
    );
  }
}
