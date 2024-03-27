import 'package:flutter/material.dart';
import 'package:otp_text_field_v2/otp_text_field_v2.dart';
import 'package:udhaar_kab_dega/app/app.dart';
import 'package:udhaar_kab_dega/constants/common.dart';
import 'package:udhaar_kab_dega/views/components/buttons.dart';

class MyOTPScreen extends StatelessWidget {
  const MyOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: allPadding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verify phone number',
                style: context.headlineTextStyle(),
              ),
              verticalMargin12,
              Text(
                'OTP has been sent to +91 1234567890',
                style: context.bodySmallTextStyle(),
              ),
              verticalMargin24,
              OTPTextFieldV2(
                // controller: otpController,
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: Colors.white10,
                ),
                style: const TextStyle(fontSize: 17),
                onChanged: (pin) {
                  // print('Changed: $pin');
                },
                onCompleted: (pin) {
                  // print('Completed: $pin');
                },
              ),
              verticalMargin16,
              Row(
                children: [
                  const Spacer(),
                  Text(
                    'Resend in 3:30 sec',
                    style: context.bodySmallTextStyle(),
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                label: 'Verify',
                onTap: () {},
              ),
              verticalMargin16,
            ],
          ),
        ),
      ),
    );
  }
}
