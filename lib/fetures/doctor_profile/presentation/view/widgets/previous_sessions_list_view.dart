import 'package:flutter/material.dart';
import 'package:medical_app/core/widgets/custom_patient_card.dart';

class PreviousSessionsListView extends StatelessWidget {
  const PreviousSessionsListView({super.key, required this.isHome});
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: isHome ? 0 : 26),
      sliver: SliverList.builder(
        itemCount: 20,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: const CustomPatientCard(),
        ),
      ),
    );
  }
}
