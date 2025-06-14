import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/usecases/pick_image_usecase.dart';
import 'package:medical_app/core/utils/service_locator.dart';
import 'package:medical_app/features/auth/data/repository/auth_repository.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/complete_data_view_body.dart';
import 'package:medical_app/features/auth/presentation/view_model/complete_data_cubit/complete_data_cubit.dart';
import 'package:medical_app/features/auth/presentation/view_model/pick_image_cubit/pick_image_cubit.dart';

class CompleteDataView extends StatelessWidget {
  const CompleteDataView({super.key, this.isDoctor = true});
  final bool isDoctor;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PickImageCubit(getIt.get<PickImageUsecase>()),
        ),
        BlocProvider(
          create: (context) => CompleteDataCubit(getIt.get<AuthRepository>()),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: CompleteDataViewBody(
            isDoctor: isDoctor,
          ),
        ),
      ),
    );
  }
}
