import 'package:flutter/material.dart';
import 'package:medical_app/core/strategies/auth_navigation_strategy.dart';
import 'package:medical_app/core/strategies/complete_data_factory.dart';

class FacebookNavigation extends AuthNavigationStrategy {
  FacebookNavigation(super.userModel);

  @override
  void executeNavigation(BuildContext context) {
    CompleteDataNavigationFactory.create(userModel).excuteNavigation(context);
  }
}
