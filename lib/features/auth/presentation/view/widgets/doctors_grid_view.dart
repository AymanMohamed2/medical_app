import 'package:flutter/material.dart';
import 'package:medical_app/features/patient_home/data/models/doctors_model/base_doctors_model.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/custom_doctor_card.dart';

class DoctorsGridView extends StatelessWidget {
  const DoctorsGridView({super.key, required this.baseDoctorsModel});
  final BaseDoctorsModel baseDoctorsModel;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 130 / 215,
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 20),
        itemCount: baseDoctorsModel.doctors.length,
        itemBuilder: (context, index) {
          return CustomDoctorCard(
            doctorModel: baseDoctorsModel.doctors[index],
          );
        });
  }
}
