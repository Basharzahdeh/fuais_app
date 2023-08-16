import 'package:flutter/material.dart';

class FingerprintScreen extends StatefulWidget {
  const FingerprintScreen({super.key});

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('البصمة',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 40,
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
                  Image.asset('assets/images/green dot.png', width: 16),
                  Text('  في الدوام',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
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
            SizedBox(
              height: 240,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              width: double.infinity,
              height: 75,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue[500]),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)))),
                  onPressed: () {},
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
