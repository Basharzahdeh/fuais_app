import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreen();
}

class _CreateAccountScreen extends State<CreateAccountScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool validator = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
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
                const SizedBox(height:20),
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
                  textAlign: TextAlign.end,
                  controller: email,
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
                  obscureText: validator,
                  textAlign: TextAlign.end,
                  // controller: password,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(240, 240, 240, 1),
                      hintText: "كلمة السر"),
                ),Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccountScreen(),
                        ),
                      ),
                      child: Text(
                        " قم بالدخول الان",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(112, 112, 112, 1),
                          fontFamily: 'Alexandria',
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Text(
                      "لديك حساب بالفعل ؟",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontFamily: 'Alexandria',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(40, 103, 178, 1),
                      fixedSize: const Size(372, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21)),
                    ),
                    child: const Text(
                      "استمرار",
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontFamily: 'GE_SS_Two',
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
