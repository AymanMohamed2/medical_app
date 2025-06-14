import 'package:flutter/material.dart';
import 'package:medical_app/core/functions/logout_method.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/widgets/custom_elevated_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomElevatedButton(
        buttonColor: AppColors.red,
        text: 'Logout',
        onPressed: () {
          logoutMethod(context);
        },
      ),
    );
  }
}
