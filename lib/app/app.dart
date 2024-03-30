import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:udhaar_kab_dega/gen/l10n/app_localizations.dart';
import 'package:udhaar_kab_dega/l10n/l10n.dart';
import 'package:udhaar_kab_dega/theme/theme_manager.dart';
import 'package:udhaar_kab_dega/views/screens/auth/bloc/auth_bloc.dart';
import 'package:udhaar_kab_dega/views/screens/splash/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ThemeData baseTheme = ThemeData(brightness: Brightness.dark);

  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(IsSignIn()),
        ),
      ],
      child: MaterialApp(
        title: 'Udhaar Kab Dega',
        darkTheme: getDarkTheme(context),
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
        home: const MySplashScreen(),
      ),
    );
  }
}
