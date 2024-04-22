import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sexeducation/views/define_nickname.dart';

class AgeOptionsMenuScreen extends StatefulWidget {
  const AgeOptionsMenuScreen({super.key});

  static String id = 'ageoptions_view';

  @override
  State<AgeOptionsMenuScreen> createState() => _AgeOptionsMenuScreen();
}

class _AgeOptionsMenuScreen extends State<AgeOptionsMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/background.png', fit: BoxFit.cover),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
          child: Container(
            color: Colors.white.withOpacity(0.0),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 360,
                height: 120,
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 33),
                decoration: BoxDecoration(
                  color: const Color(0xFF0E0019),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(
                    color: const Color(0xFF6568AA),
                    width: 3.0,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Escolha a idade:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 29,
                      fontFamily: 'PathKid',
                      color: Color(0xffC1CBFF),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Container(
                width: 360,
                height: 120,
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 33),
                decoration: BoxDecoration(
                  color: const Color(0xFF0E0019),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(
                    color: const Color(0xFF6568AA),
                    width: 3.0,
                  ),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DefineNicknameScreen.id);
                    },
                    child: Text(
                      '5 - 8 anos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Fredoka',
                        color: Color(0xffC1CBFF),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Container(
                width: 360,
                height: 120,
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 33),
                decoration: BoxDecoration(
                  color: const Color(0xFF0E0019),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(
                    color: const Color(0xFF6568AA),
                    width: 3.0,
                  ),
                ),
                child: const Center(
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      '9 - 12 anos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Fredoka',
                        color: Color(0xffC1CBFF),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Container(
                width: 360,
                height: 120,
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 33),
                decoration: BoxDecoration(
                  color: const Color(0xFF0E0019),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(
                    color: const Color(0xFF6568AA),
                    width: 3.0,
                  ),
                ),
                child: const Center(
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      '12 - 15 anos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Fredoka',
                        color: Color(0xffC1CBFF),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
