import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/cached_network_err_widget.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/custom_fading_widget.dart';

class CustomCashedNetworkImage extends StatelessWidget {
  const CustomCashedNetworkImage(
      {super.key,
      this.imageUrl,
      this.placeholderAspectRatio,
      this.errorAspectRatio});
  final String? imageUrl;
  final double? placeholderAspectRatio;
  final double? errorAspectRatio;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? 'www.google.com',
      fit: BoxFit.cover,
      placeholder: (context, url) => CustomFadingWidget(
        child: Container(
          color: AppColors.searchFillGrayColor,
          child: AspectRatio(
            aspectRatio: placeholderAspectRatio ?? 1,
          ),
        ),
      ),
      errorWidget: (context, url, error) => CachedNetworkErrorWidget(
        aspectRatio: errorAspectRatio,
      ),
    );
  }
}
