import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.onChanged,
      this.isEnabled,
      this.controller,
      this.onSaved});
  final String hintText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final bool? isEnabled;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
      ),
      onFieldSubmitted: onSaved,
      controller: controller,
      enabled: isEnabled,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: suffixIcon,
        ),
        filled: true,
        fillColor: AppColors.darkGrey,
        hintText: hintText,
        hintStyle: TextStyle(color: const Color.fromARGB(255, 171, 171, 171)),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
        border: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(25));
}
