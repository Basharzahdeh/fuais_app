import 'package:flutter/material.dart';
import 'package:fuais_app/ui/main/fingerprint/users_screen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ndialog/ndialog.dart';

import 'fingerprint.dart';

class FingerprintScreen extends StatefulWidget {
  const FingerprintScreen({super.key});

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  bool isLogin = false;

  List<Placemark> placemarks = [];

  late Position currentLocation;

  Future getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print(serviceEnabled);
    if (serviceEnabled == false) {
      print('plase turn on gps');
    }
    permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      currentLocation = await Geolocator.getCurrentPosition();
    }
  }

  final FingerPrint _fingerPrint = FingerPrint();
  bool _authenticationInProgress = false;

  void fingerPrintLogIn() async {
    if (_authenticationInProgress) {
      return; // Don't trigger authentication if it's already in progress
    }
    setState(() {
      _authenticationInProgress = true;
    });

    bool isFingerPrintEnable = await _fingerPrint.isFingerEn();
    if (isFingerPrintEnable) {
      bool isAuth = await _fingerPrint.isFinger('login using fingerprint');
      if (isAuth) {
        isLogin = true;
        placemarks = await placemarkFromCoordinates(
          currentLocation.latitude,
          currentLocation.longitude,
        );
        print("${placemarks[0].subLocality},${placemarks[0].thoroughfare}");
        print('${TimeOfDay.now().hour}:${TimeOfDay.now().minute}');
        print('---------------------------------------');
      }
    }

    setState(() {
      _authenticationInProgress = false;
    });
  }

  void fingerPrintLogOut() async {
    if (_authenticationInProgress) {
      return; // Don't trigger authentication if it's already in progress
    }
    setState(() {
      _authenticationInProgress = true;
    });

    bool isFingerPrintEnable = await _fingerPrint.isFingerEn();
    if (isFingerPrintEnable) {
      bool isAuth = await _fingerPrint.isFinger('login using fingerprint');
      if (isAuth) {
        isLogin = false;
        placemarks = await placemarkFromCoordinates(
          currentLocation.latitude,
          currentLocation.longitude,
        );
        print("${placemarks[0].subLocality},${placemarks[0].thoroughfare}");
        print('${TimeOfDay.now().hour}:${TimeOfDay.now().minute}');
        print('---------------------------------------');
      }
    }

    setState(() {
      _authenticationInProgress = false;
    });
  }

  @override
  void initState() {
    getPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('البصمة',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 28,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              alignment: Alignment.topRight,
              child: Text('الحالة',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              alignment: Alignment.topRight,
              child: Row(
                children: [
                  isLogin == false
                      ? Image.asset('assets/images/red dot.png', width: 16)
                      : Image.asset('assets/images/green dot.png', width: 16),
                  isLogin == false
                      ? Text('  خارج الدوام',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold))
                      : Text('  في الدوام',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              margin: EdgeInsets.only(bottom: 10, left: 30, right: 30, top: 60),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 121, 241, 173),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 7,
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  if (isLogin == false) {
                    fingerPrintLogIn();
                  } else {
                    NAlertDialog(
                      dialogStyle: DialogStyle(
                        borderRadius: BorderRadius.circular(25),
                        backgroundColor: Colors.white,
                      ),
                      dismissable: true,
                      title: Row(
                        children: [
                          Icon(
                            Icons.warning_outlined,
                            color: Colors.yellow[700],
                          ),
                          Text(' تنبيه '),
                        ],
                      ),
                      content: Text("لم يتم تسجيل الخروج"),
                      actions: <Widget>[
                        TextButton(
                            child: Text("Okay"),
                            onPressed: () => Navigator.pop(context)),
                      ],
                    ).show(context);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('بصمة الدخول ',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                        child: Image.asset(
                      'assets/images/fingerprint.png',
                      width: 90,
                    )),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 134, 134),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 7,
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  if (isLogin == true) {
                    fingerPrintLogOut();
                  } else {
                    NAlertDialog(
                      dialogStyle: DialogStyle(
                        borderRadius: BorderRadius.circular(25),
                        backgroundColor: Colors.white,
                      ),
                      dismissable: true,
                      title: Row(
                        children: [
                          Icon(
                            Icons.warning_outlined,
                            color: Colors.yellow[700],
                          ),
                          Text(' تنبيه '),
                        ],
                      ),
                      content: Text("لم يتم تسجيل الدخول"),
                      actions: <Widget>[
                        TextButton(
                            child: Text("Okay"),
                            onPressed: () => Navigator.pop(context)),
                      ],
                    ).show(context);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('بصمة الخروج ',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                        child: Image.asset(
                      'assets/images/fingerprint.png',
                      width: 90,
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              width: double.infinity,
              height: 75,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue[500]),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UsersScreen(),
                    ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'جميع الموظفين',
                            style: TextStyle(fontSize: 23),
                          )),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.groups_outlined,
                          size: 35,
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
