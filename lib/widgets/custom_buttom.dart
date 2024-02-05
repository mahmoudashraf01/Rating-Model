import 'package:flutter/material.dart';
import 'package:rating_model/widgets/colors.dart';
import 'package:rating_model/widgets/text.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.title,
    required this.action,
  });

  final String title;
  final Function() action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 180,
      child: ElevatedButton(
        onPressed: action,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(perple),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        child: Text(
          title,
          style: h5Bold,
        ),
      ),
    );
  }
}
