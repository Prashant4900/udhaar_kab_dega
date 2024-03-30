import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:udhaar_kab_dega/gen/assets.gen.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    required this.child,
    this.isLoading = false,
    super.key,
  });

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: Stack(
        children: [
          child,
          if (isLoading)
            ColoredBox(
              color: Theme.of(context).colorScheme.surface.withOpacity(.7),
              child: Center(
                child: Assets.lottie.boxLoader.lottie(
                  width: 150,
                  frameRate: const FrameRate(30),
                  options: LottieOptions(
                    enableApplyingOpacityToLayers: true,
                    enableMergePaths: true,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
