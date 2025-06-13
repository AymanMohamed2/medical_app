import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/functions.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/features/doctor_home/data/models/base_doctors_consaltant_model.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/accept_reject_section.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/date_list_view.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/meeting_link_section.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/time_widget.dart';
import 'package:medical_app/features/doctor_home/presentation/view_model/fetch_consaltants_cubit/fetch_consaltants_cubit.dart';
import 'package:medical_app/features/doctor_home/presentation/view_model/response_consaltant_cubit/response_consaltant_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ScheduleViewBody extends StatefulWidget {
  const ScheduleViewBody({super.key, required this.model});
  final DoctorConsaltantModel model;

  @override
  State<ScheduleViewBody> createState() => _ScheduleViewBodyState();
}

class _ScheduleViewBodyState extends State<ScheduleViewBody> {
  final GlobalKey<DateListViewState> dateKey = GlobalKey<DateListViewState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResponseConsaltantCubit, ResponseConsaltantState>(
      listener: (context, state) {
        if (state is ResponseConsaltantSuccess) {
          context.read<FetchConsaltantsCubit>().deleteConsaltant(state.request);
          Navigator.pop(context);
          Navigator.pop(context);
        } else if (state is ResponseConsaltantFailure) {
          customErrorSnakeBar(context, state.failure);
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: state is! ResponseConsaltantLoading,
          child: ModalProgressHUD(
            dismissible: state is ResponseConsaltantLoading,
            inAsyncCall: state is ResponseConsaltantLoading,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                    title: AppStrings.scheduleMeeting,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 52, vertical: 5),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(AppStrings.selectDate,
                            style: AppStyles.semiBold16(context)
                                .copyWith(color: AppColors.primaryColor))),
                  ),
                  DateListView(
                    key: dateKey,
                  ),
                  SizedBox(height: 45),
                  Text(
                    AppStrings.selectTime,
                    style: AppStyles.semiBold16(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  SizedBox(height: 5),
                  TimeWidget(
                    onTimeSelected: (time) {
                      context
                          .read<ResponseConsaltantCubit>()
                          .setSelectedTime(time.format(context));
                    },
                  ),
                  SizedBox(height: 40),
                  MeetingLinkSection(
                    formKey: formKey,
                  ),
                  SizedBox(height: 34),
                  AcceptRejectSection(
                    model: widget.model,
                    dateKey: dateKey,
                    formKey: formKey,
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
