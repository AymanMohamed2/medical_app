import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/enums/signup_method_enum.dart';
import 'package:medical_app/core/enums/user_role_enum.dart';
import 'package:medical_app/core/functions.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/strategies/auth_navigation_factory.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/custom_upload_photo.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/or_with_section.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/user_data_section.dart';
import 'package:medical_app/features/auth/presentation/view_model/pick_image_cubit/pick_image_cubit.dart';
import 'package:medical_app/features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';
import 'package:medical_app/features/auth/presentation/view_model/signup_cubit/signup_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PatientSignUpViewBody extends StatefulWidget {
  const PatientSignUpViewBody({super.key});

  @override
  State<PatientSignUpViewBody> createState() => _PatientSignUpViewBodyState();
}

class _PatientSignUpViewBodyState extends State<PatientSignUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late GlobalKey<CustomUploadPhotoWidgetState> profileKey;
  @override
  void initState() {
    profileKey = GlobalKey<CustomUploadPhotoWidgetState>();
    BlocProvider.of<SignupCubit>(context).userRoleEnum = UserRoleEnum.patient;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: patientSignupListener,
      builder: (context, state) {
        return PopScope(
          canPop: state is! SignupLoading,
          child: ModalProgressHUD(
            dismissible: state is SignupLoading,
            inAsyncCall: state is SignupLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // AppLogoSection(),
                    SizedBox(height: 40),
                    UserDataSection(
                      profileKey: profileKey,
                      formKey: _formKey,
                      title: AppStrings.createAccount,
                      onPressed: () {
                        final bool profileValid =
                            profileKey.currentState!.validate();
                        final bool formValid =
                            _formKey.currentState!.validate();
                        if (profileValid && formValid) {
                          context.read<SignupCubit>().profileImage =
                              context.read<PickImageCubit>().file;
                          context
                              .read<SignupCubit>()
                              .signUp(AuthMethodEnum.email, true);
                        }
                      },
                      isVisible: true,
                      isDoctor: false,
                    ),
                    SizedBox(height: 60),
                    OrWithSection(
                      facebookOnTap: () {
                        context
                            .read<SignupCubit>()
                            .signUp(AuthMethodEnum.facebook, false);
                      },
                      googleOnTap: () {
                        context
                            .read<SignupCubit>()
                            .signUp(AuthMethodEnum.google, false);
                      },
                      title: AppStrings.orSignUpWith,
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void patientSignupListener(context, state) {
    if (state is SignupSuccess) {
      AuthNavigationFactory.create(state.user).executeNavigation(context);
    } else if (state is SignupError) {
      customErrorSnakeBar(context, state.failure);
    }
  }
}
