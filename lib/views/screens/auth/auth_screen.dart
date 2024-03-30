import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udhaar_kab_dega/constants/common.dart';
import 'package:udhaar_kab_dega/gen/assets.gen.dart';
import 'package:udhaar_kab_dega/theme/theme_manager.dart';
import 'package:udhaar_kab_dega/views/components/body_widget.dart';
import 'package:udhaar_kab_dega/views/components/buttons.dart';
import 'package:udhaar_kab_dega/views/screens/auth/bloc/auth_bloc.dart';
import 'package:udhaar_kab_dega/views/screens/home/home_screen.dart';

class MyAuthScreen extends StatefulWidget {
  const MyAuthScreen({super.key});

  @override
  State<MyAuthScreen> createState() => _MyAuthScreenState();
}

class _MyAuthScreenState extends State<MyAuthScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.pushAndRemoveUntil(const MyHomeScreen());
        }

        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Something Went Wrong!.'),
            ),
          );
        }
      },
      builder: (context, state) {
        return BodyWidget(
          isLoading: state is AuthLoading,
          child: GestureDetector(
            onTap: _focusNode.unfocus,
            child: Scaffold(
              appBar: AppBar(),
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
                      const Spacer(),
                      Center(child: Assets.svg.plainLogo.svg(width: 120)),
                      const Spacer(flex: 4),
                      CustomButton(
                        onTap: () {
                          context.read<AuthBloc>().add(GoogleSignIn());
                        },
                        label: 'Sign In with Google',
                      ),
                      verticalMargin24,
                      Padding(
                        padding: horizontalPadding16,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: context.bodySmallTextStyle(),
                            children: [
                              const TextSpan(
                                text: 'By Continuing I agree to the ',
                              ),
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    //TODO: Open Terms & Conditions
                                  },
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy.',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    //TODO: Open privacy policy
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
