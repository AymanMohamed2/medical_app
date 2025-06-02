import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/assets.dart';
import 'package:medical_app/core/widgets/custom_border.dart';
import 'package:medical_app/core/widgets/custom_inkwell_widget.dart';

class EcgReadings extends StatelessWidget {
  const EcgReadings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 28),
      child: CustomInkwellWidget(
        onTap: () {},
        child: CustomBorder(
          borderClolor: AppColors.primaryColor.withAlpha(80),
          radius: 10,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              SizedBox(
                  height: 23, child: SvgPicture.asset(Assets.imagesHeartRate)),
              SizedBox(
                width: 1,
              ),
              Text(
                AppStrings.ecgRead,
                style: AppStyles.bold13(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
