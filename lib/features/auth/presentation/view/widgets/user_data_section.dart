import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/functions/show_alert_dialog.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/app_validators.dart';
import 'package:medical_app/core/widgets/custom_button.dart';
import 'package:medical_app/core/widgets/custom_text_form_field.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/custom_upload_photo.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/upload_photo_from.dart';
import 'package:medical_app/features/auth/presentation/view_model/pick_image_cubit/pick_image_cubit.dart';
import 'package:medical_app/features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';

class UserDataSection extends StatelessWidget {
  const UserDataSection({
    super.key,
    required this.isVisible,
    required this.onPressed,
    required this.title,
    required this.isDoctor,
    required this.formKey,
    required this.profileKey,
  });
  final bool isVisible;
  final bool isDoctor;

  final Function()? onPressed;
  final String title;
  final GlobalKey<FormState> formKey;
  final GlobalKey<CustomUploadPhotoWidgetState> profileKey;

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
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 25),
            child: CustomUploadPhotoidget(
              virticalSpace: 0,
              borderRadius: BorderRadius.circular(100),
              pickImageWidget: Icon(
                Icons.upload_file,
                color: AppColors.primaryColor,
                size: 20,
              ),
              splashRadius: 200,
              height: 100,
              shape: BoxShape.circle,
              key: profileKey,
              imageAspectRatio: 1.8 / 1,
              isVisible: false,
              onTap: () async {
                showAlertDialog(
                  context,
                  child: BlocProvider.value(
                    value: context.read<PickImageCubit>(),
                    child: const UploadPhotoFrom(),
                  ),
                );
              },
              width: 100,
            ),
          ),
          CustomTextField(
            validator: (value) {
              return AppValidators.generalValidator(value, AppStrings.name);
            },
            hintText: AppStrings.enterName,
            onChanged: context.read<SignupCubit>().setName,
          ),
          Visibility(visible: !isDoctor, child: SizedBox(height: 20)),
          Visibility(
            visible: !isDoctor,
            child: CustomTextField(
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
                      return AppValidators.confirmPasswordValidator(
                          value, context.read<SignupCubit>().password);
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
          // Visibility(
          //     visible: isDoctor,
          //     child: Padding(
          //       padding: const EdgeInsets.only(top: 20, bottom: 25),
          //       child: CustomUploadPhotoidget(
          //         key: photoKey,
          //         imageAspectRatio: 1.8 / 1,
          //         isVisible: false,
          //         onTap: () async {
          //           showAlertDialog(
          //             context,
          //             child: BlocProvider.value(
          //               value: context.read<PickImageCubit>(),
          //               child: const UploadPhotoFrom(),
          //             ),
          //           );
          //         },
          //         width: double.infinity,
          //       ),
          //     )),
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
