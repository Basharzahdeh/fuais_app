import 'package:flutter/material.dart';
import 'package:fuais_app/ui/main/tasks/daily_task_screen.dart';
import 'package:fuais_app/ui/main/tasks/task_handing_screen.dart';

class TasksMainScreen extends StatefulWidget {
  const TasksMainScreen({super.key});

  @override
  State<TasksMainScreen> createState() => _TasksMainScreenState();
}

class _TasksMainScreenState extends State<TasksMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme:IconThemeData(
            color: Colors.black
        ) ,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('المهمات اليومية',
            style: TextStyle(
                fontSize: 28,
                color: Colors.black54,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TaskHandingScreen(),));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Image.asset('assets/images/upload.png', width: 65),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text('تسليم المهام ',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          child: Text('يمكنك رفع المهمه الان',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black54)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DailyTaskScreen(),));

              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Image.asset('assets/images/correct.png', width: 65),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text('المهمات اليومية ',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          child: Text('اتطلع على المهمات اليومية',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black54)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Text('اذا لم تجد مهمه تواصل مع مسؤولك الان',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black26,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  height: 70,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)))),
                      onPressed: () {},
                      child: Text(
                        'تواصل الان',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
