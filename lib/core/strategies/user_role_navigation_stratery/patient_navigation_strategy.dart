import 'package:flutter/material.dart';
import 'package:medical_app/core/strategies/user_role_navigation_stratery/user_role_navigation_strategy.dart';
import 'package:medical_app/features/patient_home/presentation/view/patient_bottom_nav_bar_view.dart';

class PatientNavigationStrategy extends UserRoleNavigationStrategy {
  PatientNavigationStrategy(super.userModel);

  @override
  void executeNavigation(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => PatientBottomNavBarView()),
        (_) => false);
  }
}
