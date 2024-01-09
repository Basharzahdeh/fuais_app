import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fuais_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'providers/task_handing_provider.dart';
import 'ui/main/start/splash_screen.dart';


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
      home: SplashPage(),


    ));
  }
}

