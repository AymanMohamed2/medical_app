import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/app_validators.dart';
import 'package:medical_app/core/widgets/custom_button.dart';
import 'package:medical_app/core/widgets/custom_text_form_field.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/upload_license_widget.dart';
import 'package:medical_app/features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';

class UserDataSection extends StatelessWidget {
  const UserDataSection({
    super.key,
    required this.isVisible,
    required this.onPressed,
    required this.title,
    required this.isDoctor,
    required this.formKey,
  });
  final bool isVisible;
  final bool isDoctor;

  final Function()? onPressed;
  final String title;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    bool isActive = true;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: AppStyles.bold20(context)),
          SizedBox(height: 15),
          CustomTextField(
            validator: (value) {
              return AppValidators.generalValidator(value, AppStrings.name);
            },
            hintText: AppStrings.enterName,
            onChanged: context.read<SignupCubit>().setName,
          ),
          SizedBox(height: 20),
          CustomTextField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3),
            ],
            keyboardType: TextInputType.number,
            validator: (value) {
              return AppValidators.generalValidator(value, AppStrings.age);
            },
            hintText: AppStrings.enterAge,
            onChanged: context.read<SignupCubit>().setAge,
          ),
          SizedBox(height: 20),
          CustomTextField(
            validator: AppValidators.validateEmail,
            onChanged: context.read<SignupCubit>().setEmail,
            hintText: AppStrings.enterEmail,
          ),
          SizedBox(height: 20),
          Visibility(
            visible: isDoctor,
            child: Column(
              children: [
                CustomTextField(
                  validator: (value) {
                    return AppValidators.generalValidator(
                        value, AppStrings.hospital);
                  },
                  onChanged: context.read<SignupCubit>().setHospital,
                  hintText: AppStrings.hospital,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          StatefulBuilder(
            builder: (context, setState) => CustomTextField(
              validator: (value) {
                return AppValidators.generalValidator(
                    value, AppStrings.password);
              },
              onChanged: context.read<SignupCubit>().setPassword,
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
                    validator: (value) {
                      return AppValidators.generalValidator(
                          value, AppStrings.password);
                    },
                    onChanged: context.read<SignupCubit>().setConfirmPassword,
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
                    validator: (value) {
                      return AppValidators.generalValidator(
                          value, AppStrings.medicalCondition);
                    },
                    onChanged: context.read<SignupCubit>().setMedicalCondidion,
                    hintText: AppStrings.typeYourMedicalCondition,
                  ),
                ),
              ],
            ),
          ),
          Visibility(visible: isDoctor, child: UploadLicenseWidget()),
          SizedBox(height: 20),
          CustomButton(
            text: isVisible ? AppStrings.signUp : AppStrings.login,
            textStyle:
                AppStyles.medium24(context).copyWith(color: Colors.white),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
