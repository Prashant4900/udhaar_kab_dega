import 'package:flutter/material.dart';
import 'package:udhaar_kab_dega/app/app.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.label = 'Button',
  });

  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: onTap == null
              ? Colors.grey.withOpacity(.5)
              : Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            label,
            style: context.buttonTextStyle(),
          ),
        ),
      ),
    );
  }
}
