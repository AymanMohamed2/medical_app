import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/get_user_data.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              AppStrings.hi,
              style: AppStyles.regular25(context)
                  .copyWith(color: AppColors.textFieldBorderColor),
            ),
            Text(
              GetUserData.user!.name ?? '',
              style: AppStyles.bold25(context).copyWith(color: AppColors.black),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.bell,
              ),
            )
          ],
        ),
        Text(
          AppStrings.seemsFine,
          style: AppStyles.medium15(context)
              .copyWith(color: AppColors.textFieldBorderColor),
        ),
        SizedBox(
          height: 28,
        ),
      ],
    );
  }
}
