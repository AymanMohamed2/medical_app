import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';

class CustomWeekHourPicker extends StatefulWidget {
  final void Function({
    required int selectedDayNumber, // 1 to 7
    required int selectedHour,
  }) onChange;

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
  late int selectedDayIndex; // 0 (Saturday) to 6 (Friday)
  late int selectedHour;

  final List<String> dayLetters = ['Sa', 'Su', 'M', 'T', 'W', 'Th', 'F'];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    selectedHour = now.hour;

    switch (now.weekday) {
      case DateTime.saturday:
        selectedDayIndex = 0;
        break;
      case DateTime.sunday:
        selectedDayIndex = 1;
        break;
      case DateTime.monday:
        selectedDayIndex = 2;
        break;
      case DateTime.tuesday:
        selectedDayIndex = 3;
        break;
      case DateTime.wednesday:
        selectedDayIndex = 4;
        break;
      case DateTime.thursday:
        selectedDayIndex = 5;
        break;
      case DateTime.friday:
        selectedDayIndex = 6;
        break;
      default:
        selectedDayIndex = 0;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChange(
        selectedDayNumber: selectedDayIndex + 1,
        selectedHour: selectedHour,
      );
    });
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
                children: List.generate(7, (index) {
                  final isSelected = index == selectedDayIndex;
                  final dayLetter = dayLetters[index];
                  final dayNumber = index + 1;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDayIndex = index;
                      });
                      widget.onChange(
                        selectedDayNumber: dayNumber,
                        selectedHour: selectedHour,
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          dayLetter,
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
                        Text(
                          '$dayNumber',
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
                        )
                      ],
                    ),
                  );
                }),
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
                min: 1,
                max: 24,
                divisions: 24,
                label: '${selectedHour}h',
                onChanged: (value) {
                  setState(() {
                    selectedHour = value.round();
                  });
                  widget.onChange(
                    selectedDayNumber: selectedDayIndex + 1,
                    selectedHour: selectedHour,
                  );
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
}
