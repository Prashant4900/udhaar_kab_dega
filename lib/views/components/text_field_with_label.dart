import 'package:flutter/material.dart';
import 'package:udhaar_kab_dega/app/app.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    required this.label,
    required this.hintText,
    super.key,
  });

  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.captionTextStyle(),
        ),
        TextField(
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            prefixStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
