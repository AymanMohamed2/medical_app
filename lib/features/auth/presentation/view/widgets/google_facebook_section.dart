import 'package:flutter/material.dart';
import 'package:medical_app/core/utils/assets.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/custom_social_media_container.dart';

class GoogleFacebookSection extends StatelessWidget {
  const GoogleFacebookSection({
    super.key,
    this.googleOnTap,
    this.facebookOnTap,
  });
  final Function()? googleOnTap;
  final Function()? facebookOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSocialMediaContainer(
          onTap: googleOnTap,
        ),
        SizedBox(width: 30),
        CustomSocialMediaContainer(
          onTap: facebookOnTap,
          icon: Assets.imagesFacebook,
        ),
      ],
    );
  }
}
