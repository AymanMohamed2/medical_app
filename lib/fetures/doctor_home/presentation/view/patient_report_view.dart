import 'package:flutter/material.dart';
import 'package:medical_app/fetures/doctor_home/presentation/view/widgets/patient_report_view_body.dart';

class PatientReportView extends StatelessWidget {
  const PatientReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PatientReportViewBody(),
    ));
  }
}
