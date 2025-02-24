import 'package:flutter/material.dart';
import 'package:medical_app/fetures/auth/presentation/view/widgets/doctor_sign_up_view_body.dart';

class DoctorSignUpView extends StatelessWidget {
  const DoctorSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoctorSignUpViewBody(),
    );
  }
}
