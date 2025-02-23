import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/services/shared_prefrences_service/shared_prefrences.dart';
import 'package:medical_app/core/services/shared_prefrences_service/shared_prefrences_keys.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/fetures/auth/presentation/view/choose_rule_view.dart';

class PageviewItem extends StatelessWidget {
  const PageviewItem({
    super.key,
    required this.image,
    required this.subtitle,
    required this.isVisible,
    this.topPadding,
  });

  final String image;
  final String subtitle;
  final bool isVisible;
  final double? topPadding;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(top: topPadding ?? 15),
            child: SvgPicture.asset(
              image,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Visibility(
            visible: isVisible,
            child: GestureDetector(
              onTap: () {
                // Prefs.setBool(kIsOnBoardingViewSeen, true);
                SharedPrefrencesService.prefs
                    .setBool(SharedPrefrencesKeys.isOnBoardingShawes, true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ChooseRuleView(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  AppStrings.skip,
                  style: AppStyles.regular15(context)
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subtitle,
                style: AppStyles.bold36(context)
                    .copyWith(color: AppColors.primaryColor),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        )
      ],
    );
  }
}
