import 'package:flutter/material.dart';
import 'package:medical_app/features/patient_profile/presentation/view/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProfileViewBody(),
      ),
    );
  }
}
