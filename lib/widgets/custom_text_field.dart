import 'package:flutter/material.dart';
import 'package:rating_model/widgets/colors.dart';
import 'package:rating_model/widgets/text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.obscureText,
      required this.onChanged,
      required this.hintText,
      required this.keyboardType,
      });

  final bool obscureText;
  final void Function(String) onChanged;
  final String hintText;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: TextField(
        
        keyboardType: keyboardType,
        style: title1Bold,
        cursorColor: black,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          focusColor: grey,
          filled: true,
          fillColor: white.withOpacity(0.7),
          label: Text(
            overflow: TextOverflow.ellipsis,
            hintText,
            style: title1Bold.merge(
              TextStyle(
                color: grey,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey.withOpacity(0.2), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: grey.withOpacity(0.2), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey.withOpacity(0.5), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
