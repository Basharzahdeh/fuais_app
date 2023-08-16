import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuais_app/ui/main/fuais_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          SvgPicture.asset(
            'assets/images/undraw.svg',
            width: 20,
            height: 200,
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
          const CustomTextFormField(
              labelText: 'اسم المستخدم', hintText: 'الرجاء ادخال اسم المتسخدم'),
          const SizedBox(
            height: 20,
          ),
          const CustomTextFormField(
              labelText: 'كلمة السر', hintText: '**** ****'),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'الان',
                style: GoogleFonts.cairo(
                    textStyle: const TextStyle(color: greyColor, fontSize: 20)),
              ),
              Text(
                'لديك حساب قم بإنشاء حساب ',
                style: GoogleFonts.cairo(
                    textStyle: const TextStyle(color: greyColor, fontSize: 20)),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(onClick: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => FuaisScreen(),));}, text: 'تسجيل الدخول')
        ]),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      this.obscureText = false,
      required this.hintText});

  final String labelText;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
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
