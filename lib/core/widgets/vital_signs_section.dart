import 'package:flutter/material.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/other_patient_vitals_bloc_builder.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/bpm_bloc_builder.dart';

class VitalSignsSection extends StatelessWidget {
  const VitalSignsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: BpmBlocBuilder(),
        ),
        SizedBox(width: 8),
        Expanded(flex: 2, child: OtherPatientVitalsBlocBuilder()),
      ],
    );
  }
}
