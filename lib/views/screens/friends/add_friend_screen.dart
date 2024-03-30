import 'package:flutter/material.dart';
import 'package:udhaar_kab_dega/constants/common.dart';
import 'package:udhaar_kab_dega/theme/theme_manager.dart';
import 'package:udhaar_kab_dega/views/components/buttons.dart';
import 'package:udhaar_kab_dega/views/components/text_field_with_label.dart';

class MyAddFriendScreen extends StatelessWidget {
  const MyAddFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: allPadding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add a new Friend',
              style: context.headlineTextStyle(),
            ),
            verticalMargin12,
            Text(
              '''Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries.''',
              style: context.bodyTextStyle(),
            ),
            verticalMargin32,
            const TextFieldWithLabel(
              label: 'Friend name or number',
              hintText: 'Enter friend name or number',
            ),
            const Spacer(),
            CustomButton(
              onTap: () {},
              label: 'Create',
            ),
            verticalMargin48,
          ],
        ),
      ),
    );
  }
}
