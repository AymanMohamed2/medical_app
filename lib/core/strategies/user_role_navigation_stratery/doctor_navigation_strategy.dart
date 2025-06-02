import 'package:flutter/material.dart';
import 'package:medical_app/core/strategies/user_role_navigation_stratery/user_role_navigation_strategy.dart';
import 'package:medical_app/features/doctor_home/presentation/view/doctor_bottom_nav_bar_view.dart';

class DoctorNavigationStrategy extends UserRoleNavigationStrategy {
  DoctorNavigationStrategy(super.userModel);

  @override
  void executeNavigation(context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => DoctorBottomNavBarView()),
        (_) => false);
  }
}
