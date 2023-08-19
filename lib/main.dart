import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fuais_app/ui/main/fingerprint/enterfingerprint_screen.dart';
import 'package:fuais_app/ui/main/fingerprint/fingerprint1_screen.dart';
import 'package:fuais_app/ui/main/start/splash_screen.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'JO'),
      ],
      home: Finger2Screen(),

    );
  }
}

