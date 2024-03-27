import 'package:flutter/material.dart';
import 'package:udhaar_kab_dega/constants/common.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({
    required this.name,
    required this.title,
    required this.color,
    super.key,
    this.onTap,
    this.isSelected = false,
  });

  final String name;
  final String title;
  final Color color;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 160,
        height: 140,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color.withOpacity(.85),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: horizontalPadding16 + verticalPadding12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                  ),
                  const Spacer(),
                  Center(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            if (isSelected)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        const Spacer(),
                        Icon(
                          Icons.check_circle,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        horizontalMargin8,
                      ],
                    ),
                    verticalMargin4,
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
