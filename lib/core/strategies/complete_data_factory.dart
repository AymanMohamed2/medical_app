import 'package:flutter/material.dart';
import 'package:medical_app/core/enums/user_role_enum.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

class CompleteDataNavigationFactory {
  static CompleteDataNavigationStrategy create(UserModel userModel) {
    switch (userModel.userRole) {
      case UserRoleEnum.doctor:
        return DoctorCompleteDataNavigationStrategy(userModel);

      case UserRoleEnum.patient:
        return PatientCompleteDataNavigationStrategy(userModel);
      // ignore: unreachable_switch_default
      default:
        throw Exception('Complete Data role is missing');
    }
  }
}

abstract class CompleteDataNavigationStrategy {
  final UserModel userModel;

  CompleteDataNavigationStrategy(this.userModel);
  void excuteNavigation(BuildContext context);
}

class DoctorCompleteDataNavigationStrategy
    extends CompleteDataNavigationStrategy {
  DoctorCompleteDataNavigationStrategy(super.userModel);

  @override
  void excuteNavigation(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text('Doctor Complete Data'),
                  ),
                )),
        (_) => false);
  }
}

class PatientCompleteDataNavigationStrategy
    extends CompleteDataNavigationStrategy {
  PatientCompleteDataNavigationStrategy(super.userModel);

  @override
  void excuteNavigation(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text('Patient Complete Data'),
                  ),
                )),
        (_) => false);
  }
}
