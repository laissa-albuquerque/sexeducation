import 'package:flutter/material.dart';

class CusttomButton extends StatelessWidget {
  CusttomButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.width = 240,
      this.height = 60,
      required this.colors});

  final String buttonText;
  final Function onPressed;
  final double width;
  final double height;
  List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft, end: Alignment(0.8, 1), colors: colors),
          borderRadius: BorderRadius.circular(25.0), // Borda arredondada
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontFamily: 'Fredoka',
            ),
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: Container(
          width: 360,
          height: 224,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Color(0xFF0E0019),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            border: Border.all(
              color: Color(0xFF6568AA),
              width: 3.0,
            ),
          ),
          child: const Center(
            child: Text(
              'A galáxia que habita em mim',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'PathKid',
                color: Color(0xFFBFCAFF),
                fontSize: 38.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Icon prefixIcon;
  final Function()? onChanged;

  const MyTextField(
      {super.key,
        required this.controller,
        required this.hintText,
        required this.obscureText,
        required this.prefixIcon,
        this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Color(0xfff0f3f1),
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Color(0xfff0f3f1),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff0E0019), width: 2.0),
            borderRadius: BorderRadius.circular(30.0)),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintStyle: const TextStyle(
          fontFamily: 'KleeOne',
          fontSize: 15,
          color: Color(0xff8d8d8d),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: Color(0xff4f4f4f),
        filled: true,
      ),
    );
  }
}
