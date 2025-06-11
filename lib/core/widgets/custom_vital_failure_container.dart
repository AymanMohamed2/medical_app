import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/core/theme/app_styles.dart';

class CustomVitalFailureContainer extends StatelessWidget {
  const CustomVitalFailureContainer({
    super.key,
    required this.color,
    required this.backColor,
    this.icon,
    required this.unit,
    this.onPressed,
  });
  final Color backColor;
  final Color color;
  final void Function()? onPressed;
  final IconData? icon;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.replay_outlined)),
          ),
        ),
        Positioned(
          top: 5,
          right: 10,
          child: FaIcon(
            size: 18,
            icon,
            color: color,
          ),
        ),
        Positioned(
          bottom: 5,
          right: 10,
          child: Text(
            unit,
            style: AppStyles.bold13(context).copyWith(color: color),
          ),
        ),
      ],
    );
  }
}
