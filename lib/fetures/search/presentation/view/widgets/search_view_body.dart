import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/core/utils/lottie_assets.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_text_form_field.dart';
import 'package:medical_app/fetures/auth/presentation/view/widgets/doctors_grid_view.dart';

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
                fillColor: AppColors.searchFillGrayColor,
                hintText: AppStrings.search,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, left: 16),
                  child: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 22),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
              child:
                  SizedBox(height: MediaQuery.of(context).size.height * 0.17)),
          SliverToBoxAdapter(
              child: Lottie.asset(LottieAssets
                  .searchADoctor)), // before getting the data from the api

          // SliverToBoxAdapter(child: SizedBox(height: 18)),
          // DoctorsGridView(), // after getting the data from the api
          // SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
