import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/size_config.dart';

abstract class AppStyles {
  static TextStyle regular10(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle medium20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle semiBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle light16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle medium21(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 21),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle regular11(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 11),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle semiBold11(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 11),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle regular13(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle semiBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle bold17(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle bold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle bold35(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 35),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle bold32(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 32),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle regular16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle medium15(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle bold30(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 30),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle light12(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle bold12(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle regular14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle light14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle regular15(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle medium16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle light13(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle bold13(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle regular12(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle semiBold24(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w600,
    );
  }

  // Continue defining styles as needed...
  static double getResponsiveFontSize(context, {required double fontSize}) {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * .8;
    double upperLimit = fontSize * 1.2;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor(context) {
    double width = MediaQuery.sizeOf(context).width;
    if (width < SizeConfig.tablet) {
      return width / 400;
    } else if (width < SizeConfig.desktop) {
      return width / 1000;
    } else {
      return width / 1920;
    }
  }
}
