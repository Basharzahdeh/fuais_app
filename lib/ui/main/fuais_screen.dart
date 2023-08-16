import 'package:flutter/material.dart';

class FuaisScreen extends StatelessWidget {
  const FuaisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Text(
            "FUAIS",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Color.fromRGBO(220, 220, 220, 1),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: ListTile(
                    title: Align(
                        alignment: Alignment.centerRight,
                        child: Text("البصمة")),
                    subtitle: Align(
                        alignment: Alignment.centerRight,
                        child: Text("يمكنك تسجيل الدحول والخروج")),
                    leading: Icon(
                      Icons.fingerprint,
                      color: Colors.red,
                      size: 35,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: ListTile(
                    title: Align(
                        alignment: Alignment.bottomRight,
                        child: Text("المهمات اليومية")),
                    subtitle: Align(
                        alignment: Alignment.bottomRight,
                        child: Text("يمكنك تسجيل الدحول والخروج")),
                    leading: Icon(
                      Icons.check_circle,
                      size: 35,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
