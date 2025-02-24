import 'package:flutter/material.dart';
import 'package:medical_app/fetures/doctor_home/presentation/view/widgets/schedule_view_body.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ScheduleViewBody(),
    ));
  }
}
