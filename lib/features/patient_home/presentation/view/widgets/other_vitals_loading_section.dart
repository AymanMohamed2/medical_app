import 'package:flutter/material.dart';
import 'package:medical_app/core/widgets/custom_vital_loading_container.dart';

class OtherVitalsLoadingSection extends StatelessWidget {
  const OtherVitalsLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomVitalLoadingContainer(),
        ),
        SizedBox(width: 8),
        Expanded(
          child: CustomVitalLoadingContainer(),
        ),
      ],
    );
  }
}
