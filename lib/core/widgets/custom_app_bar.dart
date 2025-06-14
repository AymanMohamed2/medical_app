import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/functions/logout_method.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/features/doctor_home/data/models/base_doctors_consaltant_model.dart';
import 'package:medical_app/features/doctor_home/presentation/view/schedule_view.dart';
import 'package:medical_app/features/doctor_home/presentation/view_model/fetch_consaltants_cubit/fetch_consaltants_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onPressed,
    this.isVisible = false,
    this.isBackButtonVisible = true,
    this.isLogoutVisible = false,
    this.model,
  });
  final String title;
  final void Function()? onPressed;
  final bool? isVisible;
  final bool isBackButtonVisible;
  final bool isLogoutVisible;
  final DoctorConsaltantModel? model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.primaryColor.withAlpha(60),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
              visible: isBackButtonVisible,
              child: IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  size: 19,
                  Icons.arrow_back_ios,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Text(
              title,
              style: AppStyles.semiBold19(context)
                  .copyWith(color: AppColors.primaryColor),
            ),
            Spacer(),
            Visibility(
              visible: isLogoutVisible,
              child: IconButton(
                onPressed: () {
                  logoutMethod(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Visibility(
              visible: isVisible!,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext acontext) => BlocProvider.value(
                          value: context.read<FetchConsaltantsCubit>(),
                          child: ScheduleView(
                            model: model!,
                          ),
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(
                      size: 19,
                      Icons.schedule,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
