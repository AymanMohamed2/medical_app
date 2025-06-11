import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/app_validators.dart';
import 'package:medical_app/core/widgets/custom_button.dart';
import 'package:medical_app/core/widgets/custom_text_form_field.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/upload_license_widget.dart';

class CompleateDataSection extends StatelessWidget {
  const CompleateDataSection({
    super.key,
    required this.isVisible,
    required this.onPressed,
    required this.isDoctor,
    required this.formKey,
  });
  final bool isVisible;
  final bool isDoctor;

  final Function()? onPressed;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Visibility(
            visible: !isDoctor,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CustomTextField(
                keyboardType: TextInputType.number,
                hintText: 'Age',
              ),
            ),
          ),
          Visibility(
            visible: !isDoctor,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 25),
              child: CustomTextField(
                hintText: AppStrings.medicalCondition,
              ),
            ),
          ),
          Visibility(
            visible: isDoctor,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CustomTextField(
                validator: AppValidators.validateEmail,
                hintText: AppStrings.hospital,
              ),
            ),
          ),
          Visibility(
              visible: isDoctor,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 25),
                child: UploadLicenseWidget(),
              )),
          CustomButton(
            text: 'Finish',
            textStyle:
                AppStyles.medium24(context).copyWith(color: Colors.white),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
