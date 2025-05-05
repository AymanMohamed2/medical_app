import 'package:flutter/material.dart';
import 'package:medical_app/core/errors/faliure.dart';

void customErrorSnakeBar(BuildContext context, final Failure failure) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(failure.errMessage),
    ),
  );
}
