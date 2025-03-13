import 'package:flutter/material.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/app_logo_section.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/or_with_section.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/user_data_section.dart';
import 'package:medical_app/features/patient_home/presentation/view/patient_bottom_nav_bar_view.dart';

class PatientSignUpViewBody extends StatelessWidget {
  const PatientSignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppLogoSection(),
            SizedBox(height: 40),
            UserDataSection(
              title: AppStrings.createAccount,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const PatientBottomNavBarView(),
                  ),
                );
              },
              isVisible: true,
              isDoctor: false,
            ),
            SizedBox(height: 60),
            OrWithSection(
              title: AppStrings.orSignUpWith,
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
