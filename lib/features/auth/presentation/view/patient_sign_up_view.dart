import 'package:flutter/material.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/patient_sign_up_view_body.dart';

class PatientSignUpView extends StatelessWidget {
  const PatientSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PatientSignUpViewBody(),
    );
  }
}
