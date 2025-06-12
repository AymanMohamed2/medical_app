import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/features/chat/presentation/view/widgets/gradient_text.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const GradientText(
      text: 'Welcome to Ai Agent',
      style: AppStyles.styleBold35,
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.red],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
