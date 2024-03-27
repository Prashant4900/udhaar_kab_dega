import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:udhaar_kab_dega/app/app.dart';
import 'package:udhaar_kab_dega/constants/common.dart';
import 'package:udhaar_kab_dega/views/components/buttons.dart';
import 'package:udhaar_kab_dega/views/screens/auth/otp_screen.dart';

class MyPhoneAuthScreen extends StatefulWidget {
  const MyPhoneAuthScreen({super.key});

  @override
  State<MyPhoneAuthScreen> createState() => _MyPhoneAuthScreenState();
}

class _MyPhoneAuthScreenState extends State<MyPhoneAuthScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _focusNode.unfocus,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: allPadding16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to \nUdhaar Kab Dega',
                  style: context.displayTextStyle(),
                ),
                verticalMargin4,
                Text(
                  'Continue with mobile number',
                  style: context.bodyTextStyle(),
                ),
                verticalMargin24,
                Text(
                  'Mobile number',
                  style: context.captionTextStyle(),
                ),
                Focus(
                  onFocusChange: (bool hasFocus) {
                    setState(() {});
                  },
                  child: TextField(
                    focusNode: _focusNode,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    maxLength: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      prefixText: _focusNode.hasFocus ? '+91 ' : '',
                      prefixStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      hintText: _focusNode.hasFocus
                          ? '1234567890'
                          : '10 digit phone number',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: horizontalPadding16,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: context.bodySmallTextStyle(),
                      children: [
                        const TextSpan(text: 'By Continuing I agree to the '),
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //TODO: Open Terms & Conditions
                            },
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //TODO: Open privacy policy
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                verticalMargin24,
                CustomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) => const MyOTPScreen(),
                      ),
                    );
                  },
                ),
                verticalMargin32,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
