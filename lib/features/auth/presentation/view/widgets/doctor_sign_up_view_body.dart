import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/enums/signup_method_enum.dart';
import 'package:medical_app/core/enums/user_role_enum.dart';
import 'package:medical_app/core/functions.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/app_logo_section.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/user_data_section.dart';
import 'package:medical_app/features/auth/presentation/view_model/signup_cubit.dart';
import 'package:medical_app/features/auth/presentation/view_model/signup_state.dart';
import 'package:medical_app/features/doctor_home/presentation/view/doctor_bottom_nav_bar_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class DoctorSignUpViewBody extends StatefulWidget {
  const DoctorSignUpViewBody({super.key});

  @override
  State<DoctorSignUpViewBody> createState() => _DoctorSignUpViewBodyState();
}

class _DoctorSignUpViewBodyState extends State<DoctorSignUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    BlocProvider.of<SignupCubit>(context).userRoleEnum = UserRoleEnum.doctor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: doctorSignupListener,
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
                    AppLogoSection(),
                    SizedBox(height: 40),
                    UserDataSection(
                      formKey: _formKey,
                      title: AppStrings.createAccount,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<SignupCubit>()
                              .signUp(SignupMethodEnum.email);
                        }
                      },
                      isVisible: true,
                      isDoctor: true,
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

  void doctorSignupListener(context, state) {
    if (state is SignupSuccess) {
      handleSuccessSignup(context);
    } else if (state is SignupError) {
      customErrorSnakeBar(context, state.failure);
    }
  }

  void handleSuccessSignup(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const DoctorBottomNavBarView(),
      ),
    );
  }
}
