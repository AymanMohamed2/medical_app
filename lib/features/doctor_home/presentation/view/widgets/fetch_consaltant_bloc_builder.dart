import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/widgets/patient_card_list_view.dart';
import 'package:medical_app/features/doctor_home/presentation/view_model/fetch_consaltants_cubit/fetch_consaltants_cubit.dart';

class FetchConsaltantBlocBuilder extends StatelessWidget {
  const FetchConsaltantBlocBuilder({
    super.key,
    this.isScachuleIconVisible = true,
    this.padding,
  });
  final bool isScachuleIconVisible;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchConsaltantsCubit, FetchConsaltantsState>(
      builder: (context, state) {
        if (state is FetchConsaltantsSuccess) {
          if (state.baseDoctorsConsaltantModel.consaltants.isEmpty) {
            return SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                    child: const Center(child: Text('No Reservations yet'))));
          } else {
            return PatientCardListView(
              padding: padding,
              baseDoctorsConsaltantModel: state.baseDoctorsConsaltantModel,
              isIconVisible: isScachuleIconVisible,
              isHome: true,
            );
          }
        } else if (state is FetchConsaltantsFailure) {
          return SliverFillRemaining(
              hasScrollBody: false,
              child:
                  Align(child: Center(child: Text(state.failure.errMessage))));
        } else {
          return SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                  child: const Center(child: CircularProgressIndicator())));
        }
      },
    );
  }
}
