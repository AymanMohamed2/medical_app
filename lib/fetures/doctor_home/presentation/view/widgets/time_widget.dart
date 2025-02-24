import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/core/widgets/custom_border.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({
    super.key,
    required this.onTimeSelected,
  });

  final void Function(TimeOfDay) onTimeSelected;

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  late TimeOfDay selectedTime;
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    selectedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => _showTimePicker(context),
      child: CustomBorder(
        borderClolor: isDone ? AppColors.white : AppColors.primaryColor,
        padding: isDone
            ? EdgeInsets.zero
            : EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Container(
          padding: isDone
              ? EdgeInsets.symmetric(horizontal: 15, vertical: 10)
              : EdgeInsets.zero,
          decoration: BoxDecoration(
            color: isDone ? AppColors.primaryColor : AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            selectedTime.format(context),
            style: AppStyles.semiBold16(context).copyWith(
              color: isDone ? AppColors.white : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  void _showTimePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 250,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  height: 180,
                  child: CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hm,
                    initialTimerDuration: Duration(
                      hours: selectedTime.hour,
                      minutes: selectedTime.minute,
                    ),
                    onTimerDurationChanged: (Duration newDuration) {
                      setState(() {
                        selectedTime = TimeOfDay(
                          hour: newDuration.inHours,
                          minute: newDuration.inMinutes.remainder(60),
                        );
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                child: CupertinoButton(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryColor,
                  child: Text(
                    AppStrings.select,
                    style: AppStyles.regular10(context)
                        .copyWith(color: AppColors.white),
                  ),
                  onPressed: () {
                    if (selectedTime != TimeOfDay.now()) {
                      setState(() {
                        isDone = true;
                      });
                    }
                    widget.onTimeSelected(selectedTime);
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
