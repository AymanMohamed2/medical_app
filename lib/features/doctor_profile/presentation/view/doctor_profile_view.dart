import 'package:flutter/material.dart';
import 'package:medical_app/features/doctor_profile/presentation/view/widgets/doctor_profile_view_body.dart';

class DoctorProfileView extends StatelessWidget {
  const DoctorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DoctorProfileViewBody(),
      ),
    );
  }
}
