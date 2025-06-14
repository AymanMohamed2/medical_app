import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_validators.dart';
import 'package:medical_app/core/widgets/custom_elevated_button.dart';
import 'package:medical_app/core/widgets/custom_text_form_field.dart';

class CustomEditDialog extends StatefulWidget {
  final String title;
  final void Function(String value)? onSave;
  final void Function()? onCancel;
  final int? maxLines;
  final String? hintText;
  final TextInputType? keyboardType;

  const CustomEditDialog(
      {super.key,
      required this.title,
      this.onSave,
      this.onCancel,
      this.maxLines,
      this.hintText,
      this.keyboardType});

  @override
  State<CustomEditDialog> createState() => _CustomEditDialogState();
}

class _CustomEditDialogState extends State<CustomEditDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            widget.title,
            style: AppStyles.bold16(context),
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: CustomTextField(
              keyboardType: widget.keyboardType,
              maxLines: widget.maxLines ?? 1,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              errorBorderColor: AppColors.red,
              controller: textEditingController,
              validator: AppValidators.nameValidator,
              hintStyle: AppStyles.light10(context),
              borderColor: AppColors.primaryColor,
              hintText: widget.hintText ?? 'Enter the required',
              fillColor: AppColors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomElevatedButton(
                  text: 'cancel',
                  onPressed: widget.onCancel ??
                      () {
                        Navigator.pop(context);
                      }),
              const SizedBox(
                width: 10,
              ),
              CustomElevatedButton(
                  text: 'save',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onSave!(textEditingController.text);
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
