import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('المهمات اليومية',
            style: TextStyle(
                fontSize: 28,
                color: Colors.black54,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
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
                ),
                Container(
                  child: Image.asset('assets/images/upload.png', width: 65),
                ),

              ],
            ),
          ),
          Container(
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
                ),
                Container(
                  child: Image.asset('assets/images/correct.png', width: 65),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 300,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Text('اذا لم تجد مهمه تواصل مع مسؤولك الان',
                style: TextStyle(
                    fontSize: 25,
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
      ),
    );
  }
}
