import 'package:easy_splash_screen/easy_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:fuais_app/ui/auth/signin_screen.dart';





class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 115,
      logo: Image.asset(
        'assets/images/logo.jpeg',

      ),
      showLoader: true,
      navigator: SignInScreen(),
      durationInSeconds: 2,
    );
  }
}
