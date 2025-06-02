import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/doctors_grid_view.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/fetch_doctors_cubit.dart/fetch_doctors_cubit.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDoctorsCubit, FetchDoctorsState>(
        builder: (context, state) {
      if (state is FetchDoctorsSuccess) {
        return DoctorsGridView(baseDoctorsModel: state.baseDoctorsModel);
      } else if (state is FetchDoctorsFailure) {
        return SliverToBoxAdapter(
            child: Center(child: Text(state.failure.errMessage)));
      } else {
        return SliverFillRemaining(
            child: Align(child: CircularProgressIndicator()));
      }
    });
  }
}
