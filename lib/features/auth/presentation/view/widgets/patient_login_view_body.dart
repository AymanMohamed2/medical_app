import 'package:flutter/material.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/app_logo_section.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/user_data_section.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/or_with_section.dart';

class PatientLoginViewBody extends StatefulWidget {
  const PatientLoginViewBody({super.key});

  @override
  State<PatientLoginViewBody> createState() => _PatientLoginViewBodyState();
}

class _PatientLoginViewBodyState extends State<PatientLoginViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              formKey: _formKey,
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
