import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/widgets/custom_profile_image.dart';

class IamgeNameGmailSection extends StatelessWidget {
  const IamgeNameGmailSection({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.gmail,
  });
  final String imageUrl;
  final String name;
  final String gmail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 26),
        CustomProfileImage(
          circurlarRadius: 100,
          radius: 55,
          imageUrl: imageUrl,
        ),
        SizedBox(width: 13),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppStyles.semiBold20(context),
            ),
            Text(
              gmail,
              style: AppStyles.regular13(context),
            ),
          ],
        )
      ],
    );
  }
}
