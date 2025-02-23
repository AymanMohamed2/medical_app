import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';

class SligdingText extends StatelessWidget {
  const SligdingText({super.key, required this.sligingAnimation});

  final Animation<Offset> sligingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: sligingAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: sligingAnimation,
          child: Text(
            textAlign: TextAlign.center,
            AppStrings.appName,
            style: AppStyles.bold35(context).copyWith(color: Colors.white),
          ),
        );
      },
    );
  }
}
