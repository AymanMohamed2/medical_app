import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/functions.dart';
import 'package:medical_app/core/strategies/user_role_navigation_stratery/user_role_navigation_factory.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/features/auth/data/models/complete_doctor_data_request_model.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/compleate_data_section.dart';
import 'package:medical_app/features/auth/presentation/view_model/complete_data_cubit/complete_data_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CompleteDataViewBody extends StatelessWidget {
  const CompleteDataViewBody({super.key, this.isDoctor = true});
  final bool isDoctor;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteDataCubit, CompleteDataState>(
      listener: (context, state) {
        if (state is CompleteDataSuccess) {
          UserRoleNavigationFactory.create(state.userModel)
              .executeNavigation(context);
        } else if (state is CompleteDataFailure) {
          customErrorSnakeBar(context, state.failure);
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: state is! CompleteDataLoading,
          child: ModalProgressHUD(
            dismissible: state is CompleteDataLoading,
            inAsyncCall: state is CompleteDataLoading,
            child: Padding(
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
                      onPressed: (photoKey) {
                        if (isDoctor) {
                          if (photoKey.currentState!.validate()) {
                            var request = CompleteDoctorDataRequestModel();
                            context
                                .read<CompleteDataCubit>()
                                .completeData(request);
                          }
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
