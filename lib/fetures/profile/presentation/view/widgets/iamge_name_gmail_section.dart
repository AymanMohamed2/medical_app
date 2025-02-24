import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/widgets/custom_profile_image.dart';

class IamgeNameGmailSection extends StatelessWidget {
  const IamgeNameGmailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 26),
        CustomProfileImage(
          radius: 55,
          imageUrl: 'https://i.pravatar.cc/300',
        ),
        SizedBox(width: 13),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Name',
              style: AppStyles.semiBold20(context),
            ),
            Text(
              'Patient Gmail@gmail.com',
              style: AppStyles.regular13(context),
            ),
          ],
        )
      ],
    );
  }
}
