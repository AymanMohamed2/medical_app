import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/services/image_picker_service/pick_image_from_camera.dart';
import 'package:medical_app/core/services/image_picker_service/pick_image_from_gallery.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/service_locator.dart';
import 'package:medical_app/core/widgets/custom_elevated_button.dart';
import 'package:medical_app/features/auth/presentation/view_model/pick_image_cubit/pick_image_cubit.dart';

class UploadPhotoFrom extends StatelessWidget {
  const UploadPhotoFrom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppStrings.uploadPhotoFrom, style: AppStyles.bold13(context)),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  context
                      .read<PickImageCubit>()
                      .pickImage(getIt.get<PickImageFromCamera>());
                },
                text: AppStrings.camera,
                textStyle:
                    AppStyles.bold10(context).copyWith(color: AppColors.white),
              ),
            ),
            const SizedBox(
              width: 35,
            ),
            Expanded(
              child: CustomElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  context
                      .read<PickImageCubit>()
                      .pickImage(getIt.get<PickImageFromGallery>());
                },
                text: AppStrings.gallery,
                textStyle:
                    AppStyles.bold10(context).copyWith(color: AppColors.white),
              ),
            )
          ],
        )
      ],
    );
  }
}
