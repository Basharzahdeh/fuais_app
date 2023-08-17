import 'package:flutter/material.dart';
import 'package:fuais_app/ui/main/tasks/tasks_main_screen.dart';

import '../fingerprint/fingerprint_screen.dart';
import '../tasks/daily_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor:Colors.white,
          iconTheme:IconThemeData(
            color: Colors.black
          ) ,
          title: Text(
            "الصفحة الرئيسية",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Color(0xffffffff),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FingerprintScreen(),));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Container(
                          child: Icon(
                            Icons.fingerprint,
                            color: Colors.red,
                            size: 60,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('البصمة',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Text('يمكنك تسجيل الدهول والخروج',
                                    style:
                                    TextStyle(fontSize: 16, color: Colors.black54)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TasksMainScreen(),));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Container(
                          child: Icon(
                            Icons.check_circle,
                            size: 60,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('المهمات اليومية',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Text('يمكنك الاطلاع على المهمات المضافة',
                                    style:
                                    TextStyle(fontSize: 16, color: Colors.black54)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
