import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_border.dart';
import 'package:medical_app/core/widgets/custom_inkwell_widget.dart';

class UploadLicenseWidget extends StatelessWidget {
  const UploadLicenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.upload,
          style: AppStyles.medium15(context),
        ),
        SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          height: 150,
          child: CustomInkwellWidget(
            onTap: () {},
            child: CustomBorder(
              child: Icon(
                Icons.upload_file,
                size: 35,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
