import 'package:flutter/material.dart';
import 'package:medical_app/core/strategies/auth_navigation_strategy.dart';
import 'package:medical_app/core/strategies/complete_data_factory.dart';

class GoogleNavigation extends AuthNavigationStrategy {
  GoogleNavigation(super.userModel);

  @override
  void executeNavigation(BuildContext context) {
    if (userModel.isCompeleteData) {
    } else {
      CompleteDataNavigationFactory.create(userModel).excuteNavigation(context);
    }
  }
}
