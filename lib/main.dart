import 'package:flutter/material.dart';
import 'package:fuais_app/ui/main/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'ui/employees/employees_screen.dart';
import 'ui/fingerprint/fingerprint_screen.dart';
import 'ui/tasks/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'JO'),
      ],
      home: EmployeesScreen(),
    );
  }
}
