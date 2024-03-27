import 'package:flutter/material.dart';
import 'package:udhaar_kab_dega/app/app.dart';
import 'package:udhaar_kab_dega/constants/common.dart';
import 'package:udhaar_kab_dega/views/components/buttons.dart';
import 'package:udhaar_kab_dega/views/components/text_field_with_label.dart';

class MyCreateGroupScreen extends StatelessWidget {
  const MyCreateGroupScreen({super.key});

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
              'Create a new Group',
              style: context.headlineTextStyle(),
            ),
            verticalMargin12,
            Text(
              '''Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries.''',
              style: context.bodyTextStyle(),
            ),
            verticalMargin48,
            const TextFieldWithLabel(
              label: 'Group name',
              hintText: 'Enter group name',
            ),
            verticalMargin16,
            const TextFieldWithLabel(
              label: 'Group description',
              hintText: 'Enter group description',
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
