import 'package:flutter/material.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme:IconThemeData(
              color: Colors.black
          ) ,
          title: Text('جميع الموظفين',
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
            InkWell(
              onTap: () {
                setState(() {
                  open = !open;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 215, 215, 215),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text('محمد القناص',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                      subtitle: Text('Mobile Developer'),
                      leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/img.png')),
                      trailing: Container(
                        width: 90,
                        child: Row(children: [
                          Image.asset(
                            'assets/images/green dot.png',
                            width: 15,
                          ),
                          Text(
                            '  متصل الان',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                    if (open == true)
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 30),
                            child: Text('الدخول : 18/8/2023 10:10',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 50),
                            child: Text('الخروج : لم يتم تسجيل الخروج ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                          )
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
