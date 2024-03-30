import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udhaar_kab_dega/constants/common.dart';
import 'package:udhaar_kab_dega/theme/theme_manager.dart';
import 'package:udhaar_kab_dega/views/components/body_widget.dart';
import 'package:udhaar_kab_dega/views/components/buttons.dart';
import 'package:udhaar_kab_dega/views/screens/auth/auth_screen.dart';
import 'package:udhaar_kab_dega/views/screens/auth/bloc/auth_bloc.dart';

class MyProfileDetailScreen extends StatelessWidget {
  const MyProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLogOut) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<dynamic>(
              builder: (_) => const MyAuthScreen(),
            ),
            (route) => false,
          );
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
          child: Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Padding(
                padding: horizontalPadding16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalMargin12,
                    Text(
                      'Account details',
                      style: context.subHeadlineTextStyle(),
                    ),
                    verticalMargin24,
                    Text(
                      'PERSONAL',
                      style: context.bodyTextStyle().copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    const Spacer(),
                    CustomButton(
                      label: 'LOG OUT',
                      onTap: () {
                        context.read<AuthBloc>().add(SignOut());
                      },
                    ),
                    verticalMargin32,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
