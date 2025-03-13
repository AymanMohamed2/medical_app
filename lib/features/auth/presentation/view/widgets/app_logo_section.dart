import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/assets.dart';

class AppLogoSection extends StatelessWidget {
  const AppLogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          child: SizedBox(
            width: 160,
            child: Stack(
              children: [
                SvgPicture.asset(
                  colorFilter:
                      ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                  Assets.imagesLogo,
                ),
                Positioned(
                  bottom: 25,
                  left: 0,
                  right: 0,
                  child: Text(
                    AppStrings.appName,
                    textAlign: TextAlign.center,
                    style: AppStyles.bold25(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
