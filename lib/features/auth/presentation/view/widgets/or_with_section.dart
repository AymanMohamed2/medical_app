import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/google_facebook_section.dart';

class OrWithSection extends StatelessWidget {
  const OrWithSection({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            textAlign: TextAlign.center, style: AppStyles.light16(context)),
        SizedBox(height: 25),
        GoogleFacebookSection(
          googleOnTap: () {},
          facebookOnTap: () {},
        ),
      ],
    );
  }
}
