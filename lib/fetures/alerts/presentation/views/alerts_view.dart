import 'package:flutter/material.dart';
import 'package:medical_app/fetures/alerts/presentation/views/widgets/alerts_view_body.dart';

class AlertsView extends StatelessWidget {
  const AlertsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: AlertsViewBody(),
    ));
  }
}
