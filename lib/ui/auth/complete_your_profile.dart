import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fuais_app/ui/auth/signin_screen.dart';

class CompleteYourProfile extends StatefulWidget {
  const CompleteYourProfile({Key? key}) : super(key: key);

  @override
  State<CompleteYourProfile> createState() => _CompleteYourProfileState();
}

class _CompleteYourProfileState extends State<CompleteYourProfile> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? pikedImagenew;
  bool check = false;

  String nameController = "";
  String programlangController = "";
  String majorController = "";
  String trainigtypeController = "";
  String yeargraduateController = "";
  String graduationYear = "";

  final _formKey = GlobalKey<FormState>();

  Future<void> getgallery() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);

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
                    child: const Column(
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
                    child: const Column(
                      children: [
                        Icon(Icons.camera_alt),
                        SizedBox(height: 8),
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
      final imagePickerResult =
          await _imagePicker.pickImage(source: imageSource);
      if (imagePickerResult != null) {
        setState(() {
          pikedImagenew = imagePickerResult;
        });
      }
    }
  }

  Widget _buildCircleAvatar() {
    if (pikedImagenew == null) {
      return const CircleAvatar(
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
          backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
          title: const Text(
            "أكمل ملفك الشخصي",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                            margin: const EdgeInsets.only(top: 80, left: 90),
                            child: IconButton(
                              onPressed: () {
                                _selectProfileImage();
                              },
                              icon: const Icon(
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
                  const Text("يرجى رفع صورة شحصية رسمية"),
                  const SizedBox(height: 10),
                  TextFormField(
                    onSaved: (newValue) {
                      nameController = newValue!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "يجب ادخال الاسم ";
                      }
                      return null;
                    },
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(240, 240, 240, 1),
                      hintText: "الاسم من ثلاث مقاطع باللفة العربية",
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownSearch<String>(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "يجب ادخال التخصص الجامعي ";
                      }
                      return null;
                    },
                    selectedItem: "التخصص الجامعي",
                    items: ["cs", "cis", "mis"],
                    onChanged: (value) {
                      majorController = value!;
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownSearch<String>(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "يجب اختيار نوع التدريب ";
                      }
                      return null;
                    },
                    selectedItem: "نوع التدريب",
                    items: ["تدريب جامعة", "تدريب عملي"],
                    onChanged: (value) {
                      trainigtypeController = value!;
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownSearch<String>(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "يجب اختيار لغة البرمجة ";
                      }
                      return null;
                    },
                    selectedItem: "لغة البرمجة",
                    items: ["flutter", "web", "asp.net", "cyper security"],
                    onChanged: (value) {
                      programlangController = value!;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 50),
                        lastDate: DateTime(DateTime.now().year + 50),
                        locale:
                            const Locale("ar", "AE"), // Add your desired locale
                      );

                      if (selectedDate != null) {
                        setState(() {
                          graduationYear = selectedDate.year.toString();
                        });
                      }
                    },
                    child: TextFormField(
                      enabled: false,
                      initialValue: graduationYear,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(240, 240, 240, 1),
                        hintText: "سنة التخرج",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text(
                            'أكمال الملف الشخصي',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
