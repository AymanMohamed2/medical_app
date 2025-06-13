import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: FaIcon(
            size: 35,
            FontAwesomeIcons.fileArrowUp,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        FittedBox(
            fit: BoxFit.scaleDown,
            child:
                Text(AppStrings.uploadImage, style: AppStyles.bold11(context)))
      ],
    );
  }
}
