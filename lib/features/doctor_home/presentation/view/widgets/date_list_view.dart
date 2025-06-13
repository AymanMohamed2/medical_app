import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/features/doctor_home/presentation/view/widgets/custom_date_item.dart';
import 'package:medical_app/features/doctor_home/presentation/view_model/response_consaltant_cubit/response_consaltant_cubit.dart';

class DateListView extends StatefulWidget {
  const DateListView({super.key});

  @override
  DateListViewState createState() => DateListViewState();
}

class DateListViewState extends State<DateListView> {
  int selectedIndex = -1;
  List<MyDay> days = getNext9Days();
  String? errorText;

  bool validate() {
    if (selectedIndex == -1) {
      setState(() {
        errorText = 'Please select a date';
      });
      return false;
    } else {
      setState(() {
        errorText = null;
      });
      return true;
    }
  }

  DateTime? get selectedDate =>
      selectedIndex != -1 ? days[selectedIndex].date : null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          runSpacing: 14,
          children: List.generate(
            days.length,
            (index) => GestureDetector(
              onTap: () {
                context
                    .read<ResponseConsaltantCubit>()
                    .setSelectedDate(days[index].date);
                setState(() {
                  selectedIndex = index;
                  errorText = null;
                  // clear error when selected
                });
              },
              child: CustomDateItem(
                date: '${days[index].month}/${days[index].day}',
                day: days[index].dayName,
                isActive: index == selectedIndex,
              ),
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 6.0, left: 8.0),
            child: Text(
              errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 13),
            ),
          ),
      ],
    );
  }
}

class MyDay {
  final DateTime date;
  final String dayName;
  final int day;
  final int month;

  MyDay({
    required this.date,
    required this.dayName,
    required this.day,
    required this.month,
  });

  @override
  String toString() => '$dayName - $day/$month';
}

List<MyDay> getNext9Days() {
  final now = DateTime.now();
  final List<MyDay> days = [];

  for (int i = 0; i < 9; i++) {
    final current = now.add(Duration(days: i));
    final dayName = _getWeekdayName(current.weekday);

    days.add(
      MyDay(
        date: current,
        dayName: dayName,
        day: current.day,
        month: current.month,
      ),
    );
  }

  return days;
}

String _getWeekdayName(int weekday) {
  const names = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  return names[weekday - 1];
}
