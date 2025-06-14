import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/functions/show_alert_dialog.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/app_validators.dart';
import 'package:medical_app/core/widgets/custom_button.dart';
import 'package:medical_app/core/widgets/custom_text_form_field.dart';
import 'package:medical_app/features/auth/data/models/complete_doctor_data_request_model.dart';
import 'package:medical_app/features/auth/data/models/complete_patient_data_request_model.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/custom_upload_photo.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/upload_photo_from.dart';
import 'package:medical_app/features/auth/presentation/view_model/complete_data_cubit/complete_data_cubit.dart';
import 'package:medical_app/features/auth/presentation/view_model/pick_image_cubit/pick_image_cubit.dart';

class CompleateDataSection extends StatefulWidget {
  const CompleateDataSection({
    super.key,
    required this.isVisible,
    required this.onPressed,
    required this.isDoctor,
  });
  final bool isVisible;
  final bool isDoctor;

  final Function(GlobalKey<CustomUploadPhotoWidgetState>)? onPressed;

  @override
  State<CompleateDataSection> createState() => _CompleateDataSectionState();
}

class _CompleateDataSectionState extends State<CompleateDataSection> {
  late GlobalKey<CustomUploadPhotoWidgetState> photoKey;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    photoKey = GlobalKey<CustomUploadPhotoWidgetState>();

    formKey = GlobalKey<FormState>();
    super.initState();
  }

  String? age;
  String? medicalCondition;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Visibility(
            visible: !widget.isDoctor,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CustomTextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                validator: (value) {
                  return AppValidators.generalValidator(value, AppStrings.age);
                },
                onChanged: (value) => age = value,
                keyboardType: TextInputType.number,
                hintText: 'Age',
              ),
            ),
          ),
          Visibility(
            visible: !widget.isDoctor,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 25),
              child: CustomTextField(
                onChanged: (value) => medicalCondition = value,
                validator: (value) {
                  return AppValidators.generalValidator(
                      value, AppStrings.medicalCondition);
                },
                hintText: AppStrings.medicalCondition,
              ),
            ),
          ),
          // Visibility(
          //   visible: widget.isDoctor,
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 40),
          //     child: CustomTextField(
          //       validator: AppValidators.validateEmail,
          //       hintText: AppStrings.hospital,
          //     ),
          //   ),
          // ),
          Visibility(
              visible: widget.isDoctor,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 25),
                child: CustomUploadPhotoidget(
                  key: photoKey,
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
                  width: double.infinity,
                ),
              )),
          CustomButton(
            text: 'Finish',
            textStyle:
                AppStyles.medium24(context).copyWith(color: Colors.white),
            onPressed: () {
              if (widget.isDoctor) {
                if (photoKey.currentState!.validate()) {
                  var request = CompleteDoctorDataRequestModel();
                  context.read<CompleteDataCubit>().completeData(request);
                }
              } else {
                if (formKey.currentState!.validate()) {
                  var request = CompletePatientDataRequestModel(
                      age: age!, medicalCondidion: medicalCondition!);
                  context.read<CompleteDataCubit>().completeData(request);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
