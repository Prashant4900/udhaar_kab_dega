import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData baseTheme = ThemeData(brightness: Brightness.dark);

ThemeData getDarkTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFF141720),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFEF6369),
      onPrimary: Color(0xFFFFFFFF),
      surface: Color(0xFF141720),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      linearMinHeight: 1,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xFFEF6369),
      contentTextStyle: context.bodySmallTextStyle().copyWith(
            color: const Color(0xFFFFFFFF),
          ),
    ),
    useMaterial3: true,
  );
}

extension NavigationExtension on BuildContext {
  void pushAndRemoveUntil(Widget screen) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => screen,
      ),
      (route) => false,
    );
  }

  void push(Widget screen) {
    Navigator.push(
      this,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => screen,
      ),
    );
  }
}

extension TextThemeExtension on BuildContext {
  TextStyle headlineTextStyle() {
    return Theme.of(this).textTheme.headlineLarge!.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        );
  }

  TextStyle subHeadlineTextStyle() {
    return Theme.of(this).textTheme.headlineLarge!.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        );
  }

  TextStyle appBarTextStyle() {
    return Theme.of(this).textTheme.headlineLarge!.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w900,
        );
  }

  TextStyle displayTextStyle() {
    return Theme.of(this).textTheme.headlineLarge!.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        );
  }

  TextStyle buttonTextStyle() {
    return Theme.of(this).textTheme.headlineLarge!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w900,
          letterSpacing: 1,
        );
  }

  TextStyle bodyTextStyle() {
    return Theme.of(this).textTheme.headlineLarge!.copyWith(
          fontSize: 14,
          color: const Color(0xFFDDDDDD),
        );
  }

  TextStyle bodySmallTextStyle() {
    return Theme.of(this).textTheme.headlineLarge!.copyWith(
          fontSize: 12,
          color: const Color(0xFFDDDDDD),
        );
  }

  TextStyle captionTextStyle() {
    return Theme.of(this).textTheme.headlineLarge!.copyWith(
          fontSize: 10,
          color: const Color(0xFFDDDDDD).withOpacity(.8),
        );
  }
}
