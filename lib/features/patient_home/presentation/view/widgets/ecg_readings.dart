import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/utils/assets.dart';
import 'package:medical_app/core/widgets/custom_border.dart';
import 'package:medical_app/core/widgets/custom_inkwell_widget.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/custom_fading_widget.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/fetch_ecg_status_cubit/fetch_ecg_status_cubit.dart';

class EcgReadings extends StatelessWidget {
  const EcgReadings({super.key, this.backgroundColor, this.title});
  final Color? backgroundColor;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 28),
      child: CustomInkwellWidget(
        onTap: () {
          context.read<FetchEcgStatusCubit>().fetchEcgStatus();
        },
        child: CustomBorder(
          backgroundColor: backgroundColor,
          borderClolor: AppColors.primaryColor.withAlpha(80),
          radius: 10,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              SizedBox(
                  height: 23, child: SvgPicture.asset(Assets.imagesHeartRate)),
              SizedBox(
                width: 1,
              ),
              Text(
                title ?? AppStrings.ecgRead,
                style: AppStyles.bold13(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EcgReadingsLoading extends StatelessWidget {
  const EcgReadingsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 28),
      child: CustomFadingWidget(
        child: CustomBorder(
          backgroundColor: AppColors.grey,
          borderClolor: AppColors.primaryColor.withAlpha(80),
          radius: 10,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              SizedBox(
                  height: 23, child: SvgPicture.asset(Assets.imagesHeartRate)),
              SizedBox(
                width: 1,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.darkGray,
                    borderRadius: BorderRadius.circular(10)),
                height: 5,
                width: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
