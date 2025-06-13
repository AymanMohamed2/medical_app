import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_border.dart';
import 'package:medical_app/core/widgets/custom_inkwell_widget.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/image_widget.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/pick_image_widget.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/validator_text_widget.dart';
import 'package:medical_app/features/auth/presentation/view_model/pick_image_cubit/pick_image_cubit.dart';

class CustomUploadPhotoidget extends StatefulWidget {
  const CustomUploadPhotoidget({
    super.key,
    this.onTap,
    required this.width,
    this.isVisible = true,
    this.height,
    this.imageAspectRatio = 1,
  });

  final void Function()? onTap;
  final double width;
  final bool? isVisible;
  final double? height;
  final double imageAspectRatio;

  @override
  State<CustomUploadPhotoidget> createState() => CustomUploadPhotoWidgetState();
}

class CustomUploadPhotoWidgetState extends State<CustomUploadPhotoidget> {
  bool _isValid = true; // Track validation state

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PickImageCubit, PickImageState>(
      listener: (context, state) {
        if (state is PickImageSuccess) {
          validate();
        }
      },
      builder: (context, state) {
        bool hasImage = isImagePicked(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.isVisible!) const SizedBox(height: 25),
            SizedBox(
              height: widget.height,
              width: widget.width,
              child: AspectRatio(
                aspectRatio: widget.imageAspectRatio,
                child: CustomInkwellWidget(
                  onTap: () {
                    widget.onTap!();
                  }, // Don't reset validation on tap
                  child: CustomBorder(
                    padding: hasImage
                        ? EdgeInsets.zero
                        : const EdgeInsets.symmetric(vertical: 55),
                    borderClolor: _isValid
                        ? AppColors.primaryColor // Default border color
                        : AppColors.red, // Show red border on validation fail
                    child: hasImage
                        ? ImageWidget(
                            image: context.read<PickImageCubit>().file!.path,
                          )
                        : const PickImageWidget(),
                  ),
                ),
              ),
            ),
            if (!_isValid)
              const ValidatorTextWidget(
                title: AppStrings.pleaseUploadImage,
              ),
            if (widget.isVisible!) const SizedBox(height: 25),
          ],
        );
      },
    );
  }

  bool isImagePicked(BuildContext context) =>
      context.read<PickImageCubit>().file != null;

  /// **Validation method to be called externally**
  bool validate() {
    bool isValid = isImagePicked(context);
    setState(() {
      _isValid = isValid;
    });
    return isValid;
  }
}
