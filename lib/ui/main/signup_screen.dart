import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? pikedImagenew;
  bool check = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _ramController = TextEditingController();
  TextEditingController _storageController = TextEditingController();
  TextEditingController _otherController = TextEditingController();

  Future<void> getgallery() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    } else {
      setState(() {
        check = true;
      });
    }
    setState(() {
      pikedImagenew = image;
    });
    Navigator.of(context).pop(ImageSource.gallery);
  }

  Future<void> _selectProfileImage() async {
    final imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Select Image From:"),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(ImageSource.gallery);
                    },
                    child: Column(
                      children: [
                        const Icon(Icons.photo_library),
                        const SizedBox(height: 8),
                        Text('Gallery'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(ImageSource.camera);
                    },
                    child: Column(
                      children: [
                        const Icon(Icons.camera_alt),
                        const SizedBox(height: 8),
                        Text('Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    if (imageSource != null) {
      final imagePickerResult = await _imagePicker.pickImage(source: imageSource);
      if (imagePickerResult != null) {
        setState(() {
          pikedImagenew = imagePickerResult;
        });
      }
    }
  }

  Widget _buildCircleAvatar() {
    if (pikedImagenew == null) {
      return CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 70,
      );
    } else {
      return CircleAvatar(
        backgroundImage: FileImage(File(pikedImagenew!.path)),
        radius: 70,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(220, 220, 220, 1),

          title: Text("أكمل ملفك الشخصي",style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        _buildCircleAvatar(),
                        Container(
                          margin: EdgeInsets.only(top: 80, left: 90),
                          child: IconButton(
                            onPressed: () {
                              _selectProfileImage();
                            },
                            icon: Icon(
                              Icons.add_a_photo_rounded,
                              color: Colors.red,
                              size: 45,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],

                ),
                Text("يرجى رفع صورة شحصية رسمية"),
                SizedBox(height: 10,),
                TextFormField(
                  textAlign: TextAlign.start,
                  controller: _nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(240, 240, 240, 1),
                      hintText: "الاسم من ثلاث مقاطع باللفة العربية"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.start,
                  controller: _priceController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(240, 240, 240, 1),
                      hintText: "التخصص الجامعي"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.start,
                  controller: _storageController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(240, 240, 240, 1),
                      hintText: "نوع التدريب"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.start,
                  controller: _ramController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(240, 240, 240, 1),
                      hintText: "لغة البرمجة أو الأختصاص"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.start,
                  controller: _otherController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(240, 240, 240, 1),
                      hintText: "سنة التخرج"),

                ),
                SizedBox(height: 20,),
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
                          'أكمال الملف الشخصي', style:  TextStyle(
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
      ),
    );
  }
}


