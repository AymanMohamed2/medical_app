import 'package:flutter/material.dart';
import 'package:medical_app/core/widgets/custom_patient_card.dart';
import 'package:medical_app/features/doctor_home/data/models/base_doctors_consaltant_model.dart';

class PatientCardListView extends StatelessWidget {
  const PatientCardListView({
    super.key,
    required this.isHome,
    required this.isIconVisible,
    required this.baseDoctorsConsaltantModel,
    this.padding,
  });
  final bool isHome;
  final bool isIconVisible;
  final BaseDoctorsConsaltantModel baseDoctorsConsaltantModel;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: isHome ? 0 : 26),
      sliver: SliverList.builder(
        itemCount: baseDoctorsConsaltantModel.consaltants.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: CustomPatientCard(
            doctorConsaltantModel:
                baseDoctorsConsaltantModel.consaltants[index],
            isVisible: isIconVisible,
          ),
        ),
      ),
    );
  }
}
