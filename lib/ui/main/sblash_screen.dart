import 'package:easy_splash_screen/easy_splash_screen.dart';

import 'package:flutter/material.dart';

import 'creat_account_screen.dart';
import 'home_screen.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(

      logo: Image.asset('assets/images/logo.jpeg',width: 480.0,height: 480.0,),
      showLoader: true,
      navigator: CreateAccountScreen(),
      durationInSeconds: 5,
    );
  }
}
