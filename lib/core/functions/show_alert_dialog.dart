import 'package:flutter/material.dart';

Future<void> showAlertDialog(
  BuildContext context, {
  required Widget child,
  Color? backgroundColor,
  bool barrierDismissible = true,
  ShapeBorder? shape,
}) {
  return showDialog<void>(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (BuildContext context) {
      return PopScope(
        canPop: barrierDismissible,
        child: AlertDialog(
          shape: shape,
          backgroundColor: backgroundColor,
          title: child,
        ),
      );
    },
  );
}
