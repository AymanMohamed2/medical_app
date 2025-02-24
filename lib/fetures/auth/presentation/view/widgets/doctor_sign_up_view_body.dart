import 'package:flutter/material.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/fetures/auth/presentation/view/widgets/app_logo_section.dart';
import 'package:medical_app/fetures/auth/presentation/view/widgets/user_data_section.dart';
import 'package:medical_app/fetures/doctor_home/presentation/view/doctor_bottom_nav_bar_view.dart';

class DoctorSignUpViewBody extends StatelessWidget {
  const DoctorSignUpViewBody({super.key});

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
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const DoctorBottomNavBarView(),
                  ),
                );
              },
              isVisible: true,
              isDoctor: true,
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
