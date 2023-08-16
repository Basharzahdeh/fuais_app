import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskHandingScreen extends StatefulWidget {
  const TaskHandingScreen({super.key});

  @override
  State<TaskHandingScreen> createState() => _TaskHandingScreenState();
}

class _TaskHandingScreenState extends State<TaskHandingScreen> {
  TextEditingController dobTextEditingController = TextEditingController();
  List<String> taskItems = ['اسم المهمة', 'Item 2', 'Item 3'];
  String selectedTaskItem = 'اسم المهمة'; // Default value
  String _fileText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(200, 200, 200, 1),
        title: Text("تسليم المهمة",style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),centerTitle: true,),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
             // Gender
            DropdownButtonFormField<String>(
            value: selectedTaskItem,
            onChanged: (newValue) {
              setState(() {
                selectedTaskItem = newValue!;
              });
            },
            decoration: InputDecoration(
              labelText: 'اسم المهمة',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: taskItems.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),),
              SizedBox(height: 20,),
              GestureDetector(
                child: TextFormField(
                    style: TextStyle(
                      fontSize: 12,
                    ),

                    //edi
                    // ting controller of this TextField

                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText:  ("تاريخ المهمة"), //label text of field
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    controller: dobTextEditingController,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2040));
                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement
                        setState(() => dobTextEditingController
                            .text = formattedDate);
                      } else {
                        print("Date is not selected");
                      }
                    }),
              ),
              SizedBox(height: 15,),
              Container(height: 130,
                width: 300,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                       Color.fromRGBO(235 , 235, 235, 1),
                    ),
                  ),
                  onPressed: _pickFile,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.file_download,color: Colors.grey,),
                      Text(
                        ('يرجي رفع ملف بصيغة rar أو zip'),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Text(_fileText != null
                  ? "${('Selected File:')} $_fileText"
                  : ('No file selected')),
              SizedBox(height: 250,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * .08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color:  Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        'إرسال المهمة', style:  TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 24),),

                      ),
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      print('File path: ${file.path}');
      print('File name: ${file.name}');
      print('File size: ${file.size}');
      print('File extension: ${file.extension}');

      setState(() {
        _fileText = file.path!;
      });
    } else {
      print('User canceled the file picking');
    }
  }

}
