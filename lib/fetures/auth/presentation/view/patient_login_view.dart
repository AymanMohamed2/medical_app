import 'package:flutter/material.dart';
import 'package:medical_app/fetures/auth/presentation/view/widgets/patient_login_view_body.dart';

class PatientLoginView extends StatelessWidget {
  const PatientLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PatientLoginViewBody(),
    );
  }
}
