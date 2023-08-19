import 'package:flutter/material.dart';
import 'package:fuais_app/ui/auth/signin_screen.dart';
import 'package:fuais_app/ui/auth/complete_your_profile.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreen();
}

class _CreateAccountScreen extends State<CreateAccountScreen> {
  var email = "";
  var password = "";
  bool validator = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Image.asset('assets/images/signup_img.png'),
                  const SizedBox(height: 20),
                  const Text(
                    "انشاء حساب",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Alexandria',
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "يرجى ادخال البريد الالكتروني وكلمة السر",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontFamily: 'Alexandria',
                      fontSize: 19,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    onSaved: (newValue) {
                      email = newValue!;
                    },
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          !value.contains('@')) {
                        return "يجب ادخال البريد الاكتروني ";
                      }
                      return null;
                    },
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(240, 240, 240, 1),
                        hintText: "البريد الالكتروني"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onSaved: (newValue) {
                      password = newValue!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 8) {
                        return "يجب ادخال كبمة السير ";
                      }
                      return null;
                    },
                    obscureText: validator,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(240, 240, 240, 1),
                        hintText: "كلمة السر"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ),
                          ),
                          child: Text(
                            "يوجد لديك حساب ؟ تسجيل دخول الان",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: 'Alexandria',
                              fontSize: 18,
                              // Add underline
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => CompleteYourProfile()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(40, 103, 178, 1),
                        fixedSize: const Size(372, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                      ),
                      child: const Text(
                        "تسجيل",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontFamily: 'GE_SS_Two',
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
