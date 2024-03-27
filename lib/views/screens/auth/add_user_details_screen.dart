import 'package:flutter/material.dart';
import 'package:udhaar_kab_dega/app/app.dart';
import 'package:udhaar_kab_dega/constants/common.dart';
import 'package:udhaar_kab_dega/views/components/buttons.dart';
import 'package:udhaar_kab_dega/views/components/text_field_with_label.dart';

class MyAddUserDetailScreen extends StatelessWidget {
  const MyAddUserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: horizontalPadding16 + topPadding32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add User Details',
                style: context.headlineTextStyle(),
              ),
              verticalMargin12,
              Text(
                '''Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing.''',
                style: context.bodySmallTextStyle(),
              ),
              verticalMargin48,
              const TextFieldWithLabel(
                label: 'First Name',
                hintText: 'Enter First Name',
              ),
              verticalMargin16,
              const TextFieldWithLabel(
                label: 'Last Name',
                hintText: 'Enter Last Name',
              ),
              verticalMargin16,
              const TextFieldWithLabel(
                label: 'Email',
                hintText: 'Enter Email',
              ),
              const Spacer(),
              CustomButton(
                label: 'Submit',
                onTap: () {},
              ),
              verticalMargin32,
            ],
          ),
        ),
      ),
    );
  }
}
