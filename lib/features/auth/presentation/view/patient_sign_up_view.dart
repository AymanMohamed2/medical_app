import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/utils/service_locator.dart';
import 'package:medical_app/features/auth/data/repository/auth_repository.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/patient_sign_up_view_body.dart';
import 'package:medical_app/features/auth/presentation/view_model/signup_cubit.dart';

class PatientSignUpView extends StatelessWidget {
  const PatientSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignupCubit(getIt.get<AuthRepository>()),
        child: PatientSignUpViewBody(),
      ),
    );
  }
}
