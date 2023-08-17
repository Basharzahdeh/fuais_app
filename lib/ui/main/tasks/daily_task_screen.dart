import 'package:flutter/material.dart';
import 'package:fuais_app/ui/main/tasks/task_handing_screen.dart';

class DailyTaskScreen extends StatelessWidget {
  const DailyTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController description=TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          iconTheme:IconThemeData(
              color: Colors.black
          ) ,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('المهمة اليومية',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold)),
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
                   maxLines: 16,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => TaskHandingScreen(),));},
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * .08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color:  Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          'تسليم المهمة', style:  TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),),

                      ),
                    ),
                  ),
                ),

            ],),
          ),
        ),
      ),
    );
  }
}
