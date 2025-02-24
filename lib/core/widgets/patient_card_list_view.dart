import 'package:flutter/material.dart';
import 'package:medical_app/core/widgets/custom_patient_card.dart';

class PatientCardListView extends StatelessWidget {
  const PatientCardListView({
    super.key,
    required this.isHome,
    required this.isIconVisible,
  });
  final bool isHome;
  final bool isIconVisible;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: isHome ? 0 : 26),
      sliver: SliverList.builder(
        itemCount: 20,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: CustomPatientCard(
            isVisible: isIconVisible,
          ),
        ),
      ),
    );
  }
}
