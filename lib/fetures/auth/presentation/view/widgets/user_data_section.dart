import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_button.dart';
import 'package:medical_app/core/widgets/custom_text_form_field.dart';
import 'package:medical_app/fetures/auth/presentation/view/widgets/upload_license_widget.dart';

class UserDataSection extends StatelessWidget {
  const UserDataSection({
    super.key,
    required this.isVisible,
    required this.onPressed,
    required this.title,
    required this.isDoctor,
  });
  final bool isVisible;
  final bool isDoctor;

  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    bool isActive = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: AppStyles.bold20(context)),
        SizedBox(height: 15),
        CustomTextField(
          hintText: AppStrings.enterName,
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: AppStrings.enterEmail,
        ),
        SizedBox(height: 20),
        Visibility(
          visible: isDoctor,
          child: Column(
            children: [
              CustomTextField(
                hintText: AppStrings.hospital,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        StatefulBuilder(
          builder: (context, setState) => CustomTextField(
            obscureText: isActive,
            suffixIcon: IconButton(
                onPressed: () {
                  isActive = !isActive;
                  setState(() {});
                },
                icon: isActive
                    ? Icon(
                        Icons.visibility_off,
                        color: AppColors.inactiveColor,
                      )
                    : Icon(
                        Icons.visibility,
                        color: AppColors.primaryColor,
                      )),
            hintText: AppStrings.enterPass,
          ),
        ),
        Visibility(
          visible: isVisible,
          child: Column(
            children: [
              SizedBox(height: 20),
              StatefulBuilder(
                builder: (context, setState) => CustomTextField(
                  obscureText: isActive,
                  suffixIcon: IconButton(
                      onPressed: () {
                        isActive = !isActive;
                        setState(() {});
                      },
                      icon: isActive
                          ? Icon(
                              Icons.visibility_off,
                              color: AppColors.inactiveColor,
                            )
                          : Icon(
                              Icons.visibility,
                              color: AppColors.primaryColor,
                            )),
                  hintText: AppStrings.passConfirm,
                ),
              ),
              SizedBox(height: 20),
              Visibility(
                visible: !isDoctor,
                child: CustomTextField(
                  hintText: AppStrings.medicalCondition,
                ),
              ),
            ],
          ),
        ),
        Visibility(visible: isDoctor, child: UploadLicenseWidget()),
        SizedBox(height: 20),
        CustomButton(
          text: isVisible ? AppStrings.signUp : AppStrings.login,
          textStyle: AppStyles.medium24(context).copyWith(color: Colors.white),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
