import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udhaar_kab_dega/constants/common.dart';
import 'package:udhaar_kab_dega/gen/assets.gen.dart';
import 'package:udhaar_kab_dega/theme/theme_manager.dart';
import 'package:udhaar_kab_dega/views/screens/auth/auth_screen.dart';
import 'package:udhaar_kab_dega/views/screens/auth/bloc/auth_bloc.dart';
import 'package:udhaar_kab_dega/views/screens/home/home_screen.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: context.read<AuthBloc>()..add(IsSignIn()),
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.pushAndRemoveUntil(const MyHomeScreen());
        } else if (state is AuthFailure) {
          context.pushAndRemoveUntil(const MyAuthScreen());
        }
      },
      child: Scaffold(
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.svg.plainLogo.svg(
                width: 120,
              ),
              Text(
                'Udhaar Kab Dega',
                style: context.appBarTextStyle(),
              ),
              verticalMargin16,
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                child: const LinearProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
