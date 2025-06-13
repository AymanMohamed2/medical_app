import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/features/alerts/presentation/views/widgets/doctor_alert_message.dart';
import 'package:medical_app/features/doctor_home/presentation/view_model/fetch_consaltants_cubit/fetch_consaltants_cubit.dart';

class AlertsViewBody extends StatelessWidget {
  const AlertsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: AppStrings.appBarAlerts,
          onPressed: () {},
        ),
        BlocBuilder<FetchConsaltantsCubit, FetchConsaltantsState>(
          builder: (context, state) {
            if (state is FetchConsaltantsSuccess) {
              if (state.baseDoctorsConsaltantModel.consaltants.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => DoctorAlertMessage(
                      doctorConsaltantModel:
                          state.baseDoctorsConsaltantModel.consaltants[index],
                    ),
                    itemCount:
                        state.baseDoctorsConsaltantModel.consaltants.length,
                  ),
                );
              } else {
                return Expanded(
                    child: Center(child: Text(AppStrings.noAlerts)));
              }
            } else if (state is FetchConsaltantsFailure) {
              return Expanded(
                  child: Center(
                      child: Text(
                state.failure.errMessage,
                textAlign: TextAlign.center,
              )));
            } else {
              return Expanded(
                  child: const Center(child: CircularProgressIndicator()));
            }
          },
        )
      ],
    );
  }
}
