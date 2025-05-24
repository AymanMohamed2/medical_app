import 'package:flutter/material.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

abstract class NavigationStrategy {
  final UserModel userModel;

  NavigationStrategy(this.userModel);
  void executeNavigation(BuildContext context);
}
