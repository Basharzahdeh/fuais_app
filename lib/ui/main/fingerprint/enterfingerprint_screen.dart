import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class EnterFingerScreen extends StatefulWidget {
  const EnterFingerScreen({super.key});

  @override
  State<EnterFingerScreen> createState() => _EnterFingerScreenState();
}

class _EnterFingerScreenState extends State<EnterFingerScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  String authorized = 'Not Authorized';
  bool isAuthenticating = false;

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        isAuthenticating = true;
        authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        isAuthenticating = false;
        authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        isAuthenticating = false;
        authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      authorized = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "الرجاء إدخال البصمة",
                style: TextStyle(fontSize: 25),
              ),
              Icon(
                Icons.fingerprint,
                color: Colors.blue,
                size: 100,
              ),
              Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      _authenticateWithBiometrics();
                    },
                    child: Text("التالي"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
