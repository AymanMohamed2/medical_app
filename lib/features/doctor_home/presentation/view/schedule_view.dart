import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/utils/service_locator.dart';
import 'package:medical_app/features/doctor_home/data/models/base_doctors_consaltant_model.dart';
import 'package:medical_app/features/doctor_home/data/repository/consaltant_doctor_repository.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/schedule_view_body.dart';
import 'package:medical_app/features/doctor_home/presentation/view_model/response_consaltant_cubit/response_consaltant_cubit.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key, required this.model});
  final DoctorConsaltantModel model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ResponseConsaltantCubit(getIt.get<ConsaltantDoctorRepository>()),
      child: SafeArea(
          child: Scaffold(
        body: ScheduleViewBody(
          model: model,
        ),
      )),
    );
  }
}
