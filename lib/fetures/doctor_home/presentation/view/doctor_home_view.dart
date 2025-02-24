import 'package:flutter/material.dart';
import 'package:medical_app/fetures/doctor_home/presentation/view/widgets/doctor_home_view_body.dart';

class DoctorHomeView extends StatelessWidget {
  const DoctorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DoctorHomeViewBody(),
      ),
    );
  }
}
