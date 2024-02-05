import 'package:flutter/material.dart';

void goTo({required BuildContext context, required String routName, required argument}) {
  Navigator.pushNamed(
    context,
    routName,
    arguments: argument,
  );
}
void goToWithNoBackButton({required BuildContext context, required Widget screen}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}


