import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/enums/consultant_status_enum.dart';
import 'package:medical_app/core/utils/get_user_data.dart';
import 'package:medical_app/core/utils/service_locator.dart';
import 'package:medical_app/features/doctor_home/data/models/fetch_consult_doctor_request_model.dart';
import 'package:medical_app/features/doctor_home/data/repository/consaltant_doctor_repository.dart';
import 'package:medical_app/features/doctor_home/presentation/view_model/fetch_consaltants_cubit/fetch_consaltants_cubit.dart';
import 'package:medical_app/features/doctor_profile/presentation/view/widgets/doctor_profile_view_body.dart';

class DoctorProfileView extends StatelessWidget {
  const DoctorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FetchConsaltantsCubit(getIt.get<ConsaltantDoctorRepository>())
            ..fetchConsaltants(FetchConsultDoctorRequestModel(
                doctorId: GetUserData.user!.uId!,
                status: ConsultantStatusEnum.accepted)),
      child: SafeArea(
        child: Scaffold(
          body: DoctorProfileViewBody(),
        ),
      ),
    );
  }
}
