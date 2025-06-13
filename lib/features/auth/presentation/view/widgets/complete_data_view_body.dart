import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/compleate_data_section.dart';

class CompleteDataViewBody extends StatelessWidget {
  const CompleteDataViewBody({super.key, this.isDoctor = true});
  final bool isDoctor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  'Please Complete Your Data',
                  style: AppStyles.bold17(context)
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CompleateDataSection(
              isVisible: true,
              isDoctor: isDoctor,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
