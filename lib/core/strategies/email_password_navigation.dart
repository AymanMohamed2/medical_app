import 'package:flutter/material.dart';
import 'package:medical_app/core/strategies/auth_navigation_strategy.dart';
import 'package:medical_app/core/strategies/user_role_navigation_stratery/user_role_navigation_factory.dart';

class EmailPasswordNavigation extends AuthNavigationStrategy {
  EmailPasswordNavigation(super.userModel);

  @override
  void executeNavigation(BuildContext context) {
    UserRoleNavigationFactory.create(userModel).executeNavigation(context);
  }
}
