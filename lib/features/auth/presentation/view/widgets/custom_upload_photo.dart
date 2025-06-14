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
    this.shape,
    this.splashRadius,
    this.pickImageWidget,
    this.borderRadius,
    this.virticalSpace,
  });

  final void Function()? onTap;
  final double width;
  final bool? isVisible;
  final double? height;
  final double imageAspectRatio;
  final BoxShape? shape;
  final double? splashRadius;
  final Widget? pickImageWidget;
  final BorderRadiusGeometry? borderRadius;
  final double? virticalSpace;
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
                  radius: widget.splashRadius,
                  onTap: () {
                    widget.onTap!();
                  }, // Don't reset validation on tap
                  child: CustomBorder(
                    shape: widget.shape,
                    padding: hasImage
                        ? EdgeInsets.zero
                        : EdgeInsets.symmetric(
                            vertical: widget.virticalSpace ?? 55),
                    borderClolor: _isValid
                        ? AppColors.primaryColor // Default border color
                        : AppColors.red, // Show red border on validation fail
                    child: hasImage
                        ? ClipRRect(
                            borderRadius:
                                widget.borderRadius ?? BorderRadius.zero,
                            child: ImageWidget(
                              image: context.read<PickImageCubit>().file!.path,
                            ),
                          )
                        : widget.pickImageWidget ?? const PickImageWidget(),
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
