import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/utils/service_locator.dart';
import 'package:medical_app/features/patient_home/data/repository/doctors_repository.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/home_view_body.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/fetch_doctors_cubit.dart/fetch_doctors_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              FetchDoctorsCubit(getIt.get<DoctorsRepository>())..fetchDoctors(),
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
