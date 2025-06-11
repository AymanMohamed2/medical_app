import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/core/utils/lottie_assets.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_text_form_field.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/doctors_grid_view.dart';
import 'package:medical_app/features/patient_home/presentation/view_model/fetch_doctors_cubit.dart/fetch_doctors_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 25)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 52,
              child: CustomTextField(
                onChanged: (value) {
                  if (debounce?.isActive ?? false) debounce?.cancel();
                  debounce = Timer(const Duration(milliseconds: 300), () async {
                    if (value.isNotEmpty && value != '') {
                      context.read<FetchDoctorsCubit>().fetchDoctors(value);
                    }
                    if (value == '') {
                      context.read<FetchDoctorsCubit>().addInitialState();
                    }
                  });
                },
                fillColor: AppColors.searchFillGrayColor,
                hintText: AppStrings.search,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, left: 16),
                  child: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 22),
                ),
              ),
            ),
          ),
          SearchBlocBuilder(),
          // SliverToBoxAdapter(
          //     child:
          //         SizedBox(height: MediaQuery.of(context).size.height * 0.17)),
          // SliverToBoxAdapter(
          //     child: Lottie.asset(LottieAssets
          //         .searchADoctor)), // before getting the data from the api

          // SliverToBoxAdapter(child: SizedBox(height: 18)),
          // DoctorsGridView(), // after getting the data from the api

          // SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}

Timer? debounce;

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDoctorsCubit, FetchDoctorsState>(
        builder: (context, state) {
      if (state is FetchDoctorsSuccess) {
        if (state.baseDoctorsModel.doctors.isEmpty) {
          return SliverToBoxAdapter(child: InitialSearchWidget());
        } else {
          return DoctorsGridView(baseDoctorsModel: state.baseDoctorsModel);
        }
      } else if (state is FetchDoctorsFailure) {
        return SliverToBoxAdapter(
            child: Center(child: Text(state.failure.errMessage)));
      } else if (state is FetchDoctorsInitial) {
        return SliverToBoxAdapter(
          child: InitialSearchWidget(),
        );
      } else {
        return SliverFillRemaining(
            child: Align(child: CircularProgressIndicator()));
      }
    });
  }
}

class InitialSearchWidget extends StatelessWidget {
  const InitialSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.17),
        Lottie.asset(LottieAssets.searchADoctor)
      ],
    );
  }
}
