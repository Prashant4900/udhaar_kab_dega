import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udhaar_kab_dega/gen/l10n/app_localizations.dart';
import 'package:udhaar_kab_dega/l10n/l10n.dart';
import 'package:udhaar_kab_dega/views/screens/home/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData baseTheme = ThemeData(brightness: Brightness.dark);

  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
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
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      supportedLocales: L10n.all,
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const MyHomeScreen(),
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
