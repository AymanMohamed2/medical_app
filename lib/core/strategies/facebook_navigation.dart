import 'package:flutter/material.dart';
import 'package:medical_app/core/strategies/auth_navigation_strategy.dart';
import 'package:medical_app/core/strategies/complete_data_factory.dart';
import 'package:medical_app/core/strategies/user_role_navigation_stratery/user_role_navigation_factory.dart';

class FacebookNavigation extends AuthNavigationStrategy {
  FacebookNavigation(super.userModel);

  @override
  void executeNavigation(BuildContext context) {
    if (userModel.isCompeleteData) {
      UserRoleNavigationFactory.create(userModel).executeNavigation(context);
    } else {
      CompleteDataNavigationFactory.create(userModel).excuteNavigation(context);
    }
  }
}
