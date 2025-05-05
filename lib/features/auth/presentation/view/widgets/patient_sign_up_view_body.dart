import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/enums/signup_method_enum.dart';
import 'package:medical_app/core/enums/user_role_enum.dart';
import 'package:medical_app/core/functions.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/app_logo_section.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/or_with_section.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/user_data_section.dart';
import 'package:medical_app/features/auth/presentation/view_model/signup_cubit.dart';
import 'package:medical_app/features/auth/presentation/view_model/signup_state.dart';
import 'package:medical_app/features/patient_home/presentation/view/patient_bottom_nav_bar_view.dart';

class PatientSignUpViewBody extends StatefulWidget {
  const PatientSignUpViewBody({super.key});

  @override
  State<PatientSignUpViewBody> createState() => _PatientSignUpViewBodyState();
}

class _PatientSignUpViewBodyState extends State<PatientSignUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    BlocProvider.of<SignupCubit>(context).userRoleEnum = UserRoleEnum.patient;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: patientSignupListener,
      builder: (context, state) {
        return Padding(
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
                  isDoctor: false,
                ),
                SizedBox(height: 60),
                OrWithSection(
                  title: AppStrings.orSignUpWith,
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }

  void patientSignupListener(context, state) {
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
        builder: (BuildContext context) => const PatientBottomNavBarView(),
      ),
    );
  }
}
