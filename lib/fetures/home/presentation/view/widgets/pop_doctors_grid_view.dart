import 'package:flutter/material.dart';
import 'package:medical_app/fetures/home/presentation/view/widgets/custom_doctor_card.dart';

class PopDoctorsGridView extends StatelessWidget {
  const PopDoctorsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 130 / 215,
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 20),
        itemCount: 20,
        itemBuilder: (context, index) {
          return CustomDoctorCard();
        });
  }
}
