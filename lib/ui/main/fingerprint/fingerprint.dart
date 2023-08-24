import 'package:local_auth/local_auth.dart';

class FingerPrint {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> isFingerEn() async {
    bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    return canAuthenticateWithBiometrics;
  }

  Future<bool> isFinger(String reason) async {
    final bool canAuthenticate = await auth.authenticate(
        localizedReason: reason, options: AuthenticationOptions(biometricOnly: true));
    return canAuthenticate;
  }
}
