import 'package:flutter/material.dart';
import 'package:medical_app/features/auth/presentation/view/widgets/complete_data_view_body.dart';

class CompletePatientDataView extends StatelessWidget {
  const CompletePatientDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CompleteDataViewBody(),
      ),
    );
  }
}
