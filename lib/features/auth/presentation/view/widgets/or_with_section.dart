import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/google_facebook_section.dart';

class OrWithSection extends StatelessWidget {
  const OrWithSection(
      {super.key, required this.title, this.googleOnTap, this.facebookOnTap});
  final String title;
  final void Function()? googleOnTap;
  final void Function()? facebookOnTap;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(title,
          textAlign: TextAlign.center, style: AppStyles.light16(context)),
      SizedBox(height: 25),
      GoogleFacebookSection(
        googleOnTap: googleOnTap,
        facebookOnTap: facebookOnTap,
      ),
    ]);
  }
}
