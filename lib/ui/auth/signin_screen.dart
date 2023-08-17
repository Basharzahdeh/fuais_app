import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuais_app/ui/main/start/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'create_account_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email = '';
  String password = '';
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/images/login.svg',
                width: 20,
                height: 170,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'تسجيل الدخول',
              style: GoogleFonts.cairo(
                  textStyle: const TextStyle(color: textColor, fontSize: 25)),
              textAlign: TextAlign.center,
            ),
            Text(
              'يرجى ادخال اسم المستخدم \nوكلمة السر للدخول الى النظام',
              style: GoogleFonts.cairo(
                  textStyle: const TextStyle(color: greyColor, fontSize: 20)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextFormField(
                onSave: (val) {
                  email = val!;
                },
                labelText: 'اسم المستخدم',
                hintText: 'الرجاء ادخال اسم المتسخدم'),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                onSave: (val) {
                  password = val!;
                },
                labelText: 'كلمة السر',
                hintText: '**** ****'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => CreateAccountScreen(),
                    ));
                  },
                  child: Text(
                    'قم بإنشاء حساب',
                    style: GoogleFonts.cairo(
                      textStyle: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                onClick: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
                  }
                },
                text: 'تسجيل الدخول')
          ]),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.onSave,
      required this.labelText,
      this.obscureText = false,
      required this.hintText});

  final String labelText;
  final String hintText;
  final bool obscureText;
  final Function(String?) onSave;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
          onSaved: onSave,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'الرجاء تعبئة الحقل';
            } else {
              return null;
            }
          },
          textAlign: TextAlign.right,
          obscureText: obscureText,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: whiteColor, width: 1)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: whiteColor, width: 1)),
              disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: whiteColor, width: 1)),
              fillColor: textFormFieldColor,
              filled: true,
              labelText: labelText,
              hintText: hintText,
              hintStyle: const TextStyle(color: greyColor, fontSize: 15),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              labelStyle: const TextStyle(color: textColor, fontSize: 20))),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onClick, required this.text});

  final VoidCallback onClick;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
            backgroundColor: signInUpButtonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            minimumSize: const Size(double.infinity, 75)),
        child: Text(
          text,
          style: GoogleFonts.cairo(textStyle: const TextStyle(fontSize: 20)),
        ));
  }
}

const Color whiteColor = Color(0xffffffff);
const Color textColor = Color(0xff2e3138);
const Color greyColor = Color(0xffa6a3a4);
const Color textFormFieldColor = Color(0xfff3f2ee);
const Color signInUpButtonColor = Color(0xff258ab6);
