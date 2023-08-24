import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fuais_app/ui/auth/complete_your_profile.dart';
import 'package:fuais_app/ui/main/fingerprint/enterfingerprint_screen.dart';
import 'package:fuais_app/ui/main/fingerprint/fingerprint1_screen.dart';
import 'package:fuais_app/providers/user_provider.dart';
import 'package:fuais_app/ui/main/fingerprint/users_screen.dart';
import 'package:fuais_app/ui/main/start/splash_screen.dart';
import 'package:fuais_app/ui/main/tasks/daily_tasks_screen.dart';
import 'package:provider/provider.dart';

import 'providers/task_handing_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(
          create: (context) => taskHandingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UsersProvider(),
        ),
      ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

      supportedLocales: [
        Locale('ar', 'JO'),
      ],
      home: DailyTasksScreen(),


    ));
  }
}

