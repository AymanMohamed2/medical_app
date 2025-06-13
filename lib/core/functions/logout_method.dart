import 'package:flutter/material.dart';
import 'package:medical_app/core/utils/service_locator.dart';
import 'package:medical_app/features/auth/data/datasources/local_data_source/base_auth_locale_datasource.dart';
import 'package:medical_app/features/auth/presentation/view/login_view.dart';

void logoutMethod(BuildContext context) {
  getIt.get<BaseAuthLocaleDatasource>().deleteUser();
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => const LoginView()), (_) => false);
}
