import 'package:flutter/material.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/patient_report_view_body.dart';

class PatientReportView extends StatelessWidget {
  const PatientReportView({super.key, required this.isVisible});
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PatientReportViewBody(
        isVisible: isVisible,
      ),
    ));
  }
}
