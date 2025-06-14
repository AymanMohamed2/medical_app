import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/core/theme/app_colors.dart';

class CustomWeekHourPicker extends StatefulWidget {
  final void Function({required int selectedDay, required int selectedHour})
      onChange;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? sliderColor;
  final TextStyle? dayTextStyle;
  final TextStyle? dateTextStyle;

  const CustomWeekHourPicker({
    super.key,
    required this.onChange,
    this.selectedColor,
    this.unselectedColor,
    this.sliderColor,
    this.dayTextStyle,
    this.dateTextStyle,
  });

  @override
  State<CustomWeekHourPicker> createState() => _CustomWeekHourPickerState();
}

class _CustomWeekHourPickerState extends State<CustomWeekHourPicker> {
  late List<DateTime> currentWeek;
  late DateTime selectedDate;
  late int selectedHour;

  @override
  void initState() {
    super.initState();
    _generateWeek();
    selectedDate = DateTime.now();
    selectedHour = DateTime.now().hour;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChange(
          selectedDay: selectedDate.day, selectedHour: selectedHour);
    });
  }

  void _generateWeek() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday % 7));
    currentWeek =
        List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final selectedColor =
        widget.selectedColor ?? Theme.of(context).primaryColor;
    final unselectedColor = widget.unselectedColor ?? Colors.black54;
    final sliderColor = widget.sliderColor ?? Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          color: AppColors.white,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
            child: SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: currentWeek.map((date) {
                  final isSelected = isSameDate(date, selectedDate);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = date;
                      });
                      widget.onChange(
                          selectedDay: selectedDate.day,
                          selectedHour: selectedHour);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          DateFormat('E').format(date).substring(0, 1),
                          style: widget.dayTextStyle?.copyWith(
                                color: isSelected
                                    ? selectedColor
                                    : unselectedColor,
                              ) ??
                              TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? selectedColor
                                    : unselectedColor,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: isSelected
                                    ? selectedColor
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            date.day.toString(),
                            style: widget.dateTextStyle?.copyWith(
                                  color: isSelected
                                      ? selectedColor
                                      : unselectedColor,
                                ) ??
                                TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isSelected
                                      ? selectedColor
                                      : unselectedColor,
                                ),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: sliderColor,
            inactiveTrackColor: Colors.grey.shade300,
            thumbColor: sliderColor,
          ),
          child: Column(
            children: [
              Slider(
                value: selectedHour.toDouble(),
                min: 0,
                max: 24,
                divisions: 24,
                label: '${selectedHour}h',
                onChanged: (value) {
                  setState(() {
                    selectedHour = value.round();
                  });
                  widget.onChange(
                      selectedDay: selectedDate.day,
                      selectedHour: selectedHour);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('6am'),
                  Text('10'),
                  Text('2'),
                  Text('6'),
                  Text('10'),
                  Text('2'),
                  Text('6am'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
