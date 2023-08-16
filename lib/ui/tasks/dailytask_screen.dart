import 'package:flutter/material.dart';

class DailyTaskScreen extends StatelessWidget {
  const DailyTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController description=TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(220, 220, 220, 1),
          title: Text("المهمات اليومية",style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
              Image.asset("assets/images/logo.jpeg"),
              SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.all(18.0),
                 child: TextFormField(
                   maxLines: 25,
                    textAlign: TextAlign.end,
                    controller: description,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "وصف المهمة"),
                  ),
               ),

            ],),
          ),
        ),
      ),
    );
  }
}
