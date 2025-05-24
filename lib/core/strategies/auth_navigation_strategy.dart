import 'package:flutter/material.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

abstract class AuthNavigationStrategy {
  final UserModel userModel;

  AuthNavigationStrategy(this.userModel);
  void executeNavigation(BuildContext context);
}
