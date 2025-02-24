import 'package:flutter/material.dart';
import 'package:medical_app/fetures/doctor_home/presentation/view/widgets/custom_date_item.dart';

class DateListView extends StatefulWidget {
  const DateListView({super.key});

  @override
  State<DateListView> createState() => _DateListViewState();
}

class _DateListViewState extends State<DateListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 5,
      runSpacing: 14,
      children: List.generate(
        9,
        (index) => GestureDetector(
          onTap: () {
            selectedIndex = index;
            setState(() {});
          },
          child: CustomDateItem(
            date: '25/5',
            day: 'Saturday',
            isActive: index == selectedIndex,
          ),
        ),
      ),
    );
  }
}
