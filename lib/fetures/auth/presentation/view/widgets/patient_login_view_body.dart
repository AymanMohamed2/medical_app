import 'package:flutter/material.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/fetures/auth/presentation/view/widgets/app_logo_section.dart';
import 'package:medical_app/fetures/auth/presentation/view/widgets/user_data_section.dart';
import 'package:medical_app/fetures/auth/presentation/view/widgets/or_with_section.dart';

class PatientLoginViewBody extends StatelessWidget {
  const PatientLoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            AppLogoSection(),
            SizedBox(height: 50),
            UserDataSection(
              title: AppStrings.loginAccount,
              onPressed: () {},
              isVisible: false,
              isDoctor: false,
            ),
            SizedBox(height: 60),
            OrWithSection(
              title: AppStrings.orLoginWith,
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
