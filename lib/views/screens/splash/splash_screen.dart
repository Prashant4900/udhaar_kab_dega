import 'package:flutter/material.dart';
import 'package:udhaar_kab_dega/app/app.dart';
import 'package:udhaar_kab_dega/constants/common.dart';
import 'package:udhaar_kab_dega/gen/assets.gen.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.svg.plainLogo.svg(
              width: 100,
            ),
            Text(
              'Udhaar Kab Dega',
              style: context.headlineTextStyle(),
            ),
            verticalMargin16,
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .6,
              child: const LinearProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
